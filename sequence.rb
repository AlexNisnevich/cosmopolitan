require 'fileutils'

def create_video(images, framerate, audio_path)
  FileUtils.mkdir 'frames' unless File.directory?('frames')
  FileUtils.rm("out.mp4") if File.exists?("out.mp4")

  idx = 0
  images.each do |i|
    (filename, frames) = i
    `convert #{filename} temp.png`
    new_idx = idx + frames

    while idx < new_idx
      dest = "frames/frame#{idx.to_s.rjust(4, '0')}.png"
      puts "Copying #{filename} -> #{dest} ..."
      FileUtils.cp("temp.png", dest)
      idx += 1
    end
  end

  `ffmpeg -framerate #{framerate} -i 'frames/frame%04d.png' -c:v libx264 -pix_fmt yuv420p out.mp4`

  FileUtils.rm("out_with_audio.mp4") if File.exists?("out_with_audio.mp4")
  `ffmpeg -i out.mp4 -i '#{audio_path}' -c:a aac -strict experimental -b:a 192k -shortest out_with_audio.mp4`
end