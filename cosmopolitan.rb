require_relative 'gondry.rb'

FPS = 115.0 / 60 * 16  # 115 bpm, 16 frames per beat
TINT = "-fill fuchsia -colorize 60% -level 70,80%"

@video = Gondry.new({width: 1920, height: 1080, framerate: FPS})

def intro_beat(image)
  [
    [@video.center_thumbnail(image, 560), 8],
    [@video.center_thumbnail(image, 600), 4], 
    [@video.center_thumbnail(image, 640), 4], 
    [@video.center_thumbnail(image, 680), 8], 
    [@video.center_thumbnail(image, 720), 16], 
    [@video.center_thumbnail(image, 760), 8], 
    [@video.center_thumbnail(image, 800), 8], 
    [@video.center_thumbnail(image, 840), 8]
  ]
end

def city(name)
  [
    [@video.search("#{name} skyline", TINT), 24], 
    [@video.blank, 8]
  ]
end

def city_stutter(city1, city2)
  [
    [@video.search("#{city1} skyline", TINT), 16],
    [@video.search("#{city2} skyline", TINT), 4],
    [@video.search("#{city1} skyline", TINT), 4],
    [@video.search("#{city2} skyline", TINT), 4],
    [@video.search("#{city1} skyline", TINT), 4]
  ]
end

script = []

script += intro_beat("contxt.jpg")
script += intro_beat("contxt.jpg")

script += intro_beat("cosmo.png")
script += intro_beat("politan.png")

script += city("Bombay")
script += city("Jakarta")
script += city("Karachi")
script += city_stutter("Moscow", "Istanbul")

script += city("Istanbul")
script += city("MexicoCity")
script += city("Shanghai")
script += city_stutter("Tokyo", "NewYork")

script += city("NewYork")
script += city("Bangkok")
script += city("Beijing")
script += city_stutter("Delhi", "London")

script += city("London")
script += city("HongKong")
script += city("Cairo")
script += city_stutter("Tehran", "Bogota")

script += city("Bogota")
script += city("Bandung")
script += city("Tianjin")
script += city_stutter("Lima", "Rio de Janeiro")

script += city("Rio de Janeiro")
script += city("Lahore Anarkali Street Liberty Market")  # "Lahore skyline" by itself doesn't yield good results
script += city("Amaris Hotel Bogor")  # "Bogor skyline" by itself doesn't yield good results
script += city_stutter("Santiago", "StPetersburg")

script += city("StPetersburg")
script += city("Shenyang")
script += city("Calcutta")
script += city_stutter("Wuhan", "Sydney")

script += city("Sydney")
script += city("Guangzhou")

script += [
  [@video.center_thumbnail("cosmo.png", 560), 12],  
  [@video.center_thumbnail("cosmo.png", 640), 12], 
  [@video.blank, 8]
]

script += [
  [@video.blank, 12],
  [@video.center_thumbnail("politan.png", 720), 4],
  [@video.center_thumbnail("politan.png", 800), 4], 
  [@video.center_thumbnail("politan.png", 840), 12]
]

script += [
  [@video.blank, 8],
  [@video.search("Singapore skyline", TINT), 8],
  [@video.search("Madras skyline", TINT), 8],
  [@video.search("Baghdad skyline", TINT), 8],

  [@video.search("Los Angeles skyline", TINT), 8],
  [@video.blank, 24],

  [@video.search("Yokohama skyline", TINT), 8],
  [@video.search("Dhaka skyline", TINT), 8],
  [@video.search("Berlin skyline", TINT), 8],
  [@video.search("Alexandria skyline", TINT), 8],

  [@video.search("Bangalore skyline", TINT), 8],
  [@video.blank, 24],
]

script += [
  [@video.blank, 8],
  [@video.search("Singapore skyline", TINT), 8],
  [@video.search("Madras skyline", TINT), 8],
  [@video.search("Baghdad skyline", TINT), 8],

  [@video.search("Los Angeles skyline", TINT), 8],
  [@video.blank, 24],

  [@video.search("Yokohama skyline", TINT), 8],
  [@video.search("Dhaka skyline", TINT), 8],
  [@video.search("Berlin skyline", TINT), 8],
  [@video.search("Alexandria skyline", TINT), 8],

  [@video.search("Bangalore skyline", TINT), 8],
  [@video.blank, 24],
]

script += [[@video.blank, 100]]

@video.produce(script, "cosmopolitan.wav")
@video.play

# create a slowed-down version, just in case
`yes | ffmpeg -i out.mp4 -filter_complex "[0:v]setpts=2*PTS[v];[0:a]atempo=0.5[a]" -map "[v]" -map "[a]" slow.mp4`