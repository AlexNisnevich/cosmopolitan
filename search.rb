require 'fileutils'

require 'google-search'
require 'open-uri'

#IM_PARAMS = "-fill red -colorize 50% -level 50,80% -resize 1920x1080^ -extent 1920x1080"
#IM_PARAMS = "-fill '#e2007a' -colorize 80% -level 70,80% -resize 1920x1080^ -extent 1920x1080"
IM_PARAMS = "-fill fuchsia -colorize 60% -level 70,80% -resize 1920x1080^ -extent 1920x1080"

def search_for_skylines(cities)
  FileUtils.mkdir 'images' unless File.directory?('images')
  FileUtils.mkdir 'processed_images' unless File.directory?('processed_images')

  cities.each do |city|
    image = Google::Search::Image.new(
      :query => city + " skyline", 
      :image_size => [:xlarge, :xxlarge, :huge]
    ).first  

    File.write("#{Dir.pwd}/images/#{city}.png", open(image.uri).read, {mode: 'wb'})

    `convert images/#{city}.png #{IM_PARAMS} processed_images/#{city}.png`

    puts city
  end
end