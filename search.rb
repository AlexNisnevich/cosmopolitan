require 'google-search'
require 'open-uri'

cities = ARGV[0].split(",")

#im_params = "-fill red -colorize 50% -level 50,80% -resize 1920x1080^ -extent 1920x1080"
#im_params = "-fill '#e2007a' -colorize 80% -level 70,80% -resize 1920x1080^ -extent 1920x1080"
im_params = "-fill fuchsia -colorize 60% -level 70,80% -resize 1920x1080^ -extent 1920x1080"

cities.each do |city|
  image = Google::Search::Image.new(
    :query => city + " skyline", 
    :image_size => [:xlarge, :xxlarge, :huge]
  ).first  

  File.write("#{Dir.pwd}/images/#{city}.png", open(image.uri).read, {mode: 'wb'})

  `convert images/#{city}.png #{im_params} processed_images/#{city}.png`

  puts city
end