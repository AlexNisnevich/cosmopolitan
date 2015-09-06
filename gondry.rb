require 'fileutils'
require 'google-search'
require 'open-uri'

class Gondry
  def initialize(props)
    @props = props

    @dest_path = "out.mp4"

    mkdir 'temp'
    mkdir 'temp/frames'
    mkdir 'temp/processed_images'
  end

  def blank(color = "black")
    path = "temp/#{color}.png"
    unless File.exists? path
      `convert -size #{dims} xc:#{color} #{path}`
      puts path
    end
    path
  end

  def produce(script, audio_path)
    idx = 0
    script.each do |entry|
      (image_path, frames) = entry

      if image_path.include? "png"
        `cp '#{image_path}' temp/temp.png`
      else
        `convert '#{image_path}' temp/temp.png`
      end

      new_idx = idx + frames
      while idx < new_idx
        dest = "temp/frames/frame#{idx.to_s.rjust(6, '0')}.png"
        puts "Copying #{image_path} -> #{dest} ..."
        FileUtils.cp("temp/temp.png", dest)
        idx += 1
      end
    end

    rm "temp/out.mp4"
    `ffmpeg -framerate #{@props[:framerate]} -i 'temp/frames/frame%06d.png' -c:v libx264 -pix_fmt yuv420p temp/out.mp4`

    rm @dest_path
    `ffmpeg -i temp/out.mp4 -i '#{audio_path}' -c:a aac -strict experimental -b:a 192k -shortest #{@dest_path}`
    @dest_path
  end

  def play
    `open #{@dest_path}`
  end

  def center_thumbnail(path, size, bgcolor = "black")
    dest_path = "temp/" + path.sub(/\.(jpg|png)/, "-#{size}.jpg")
    unless File.exists? dest_path
      `convert -define jpeg:dims=#{dims} #{path} -resize #{size}x#{size} -thumbnail '#{dims}>' -background #{bgcolor} -gravity center -extent #{dims} #{dest_path}`
      puts dest_path
    end
    dest_path
  end

  def search(term, transform = "", force = false)
    dest_path = "temp/processed_images/#{term}.png"

    unless File.exists?(dest_path) && !force
      image = Google::Search::Image.new(
        :query => term, 
        :image_dims => [:xlarge, :xxlarge, :huge]
      ).first

      File.write("#{Dir.pwd}/temp/#{term}.png", open(image.uri).read, {mode: 'wb'})

      `convert 'temp/#{term}.png' #{transform} -resize 1920x1080^ -extent 1920x1080 '#{dest_path}'`

      puts dest_path
    end

    dest_path
  end

  private

  def dims
    "#{@props[:width]}x#{@props[:height]}" 
  end

  def mkdir(path)
    FileUtils.mkdir(path) unless File.directory?(path)
  end

  def rm(path)
    FileUtils.rm(path) if File.exists?(path)
  end
end