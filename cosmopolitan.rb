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

script = []

script += intro_beat("contxt.jpg")
script += intro_beat("contxt.jpg")
script += intro_beat("cosmo.png")
script += intro_beat("politan.png")

script += city("Bombay")
script += city("Jakarta")
script += city("Karachi")
script += city("Moscow")
script += city("Istanbul")
script += city("MexicoCity")
script += city("Shanghai")
script += city("Tokyo")
script += city("NewYork")
script += city("Bangkok")
script += city("Beijing")
script += city("Delhi")
script += city("London")
script += city("HongKong")
script += city("Cairo")
script += city("Tehran")
script += city("Bogota")
script += city("Bandung")
script += city("Tianjin")
script += city("Lima")
script += city("RioDeJaneiro")
script += city("Lahore")
script += city("Bogor")
script += city("Santiago")
script += city("StPetersburg")
script += city("Shenyang")
script += city("Calcutta")
script += city("Wuhan")
script += city("Sydney")
script += city("Guangzhou")

script += [
  [@video.center_thumbnail("cosmo.png", 560), 12],  
  [@video.center_thumbnail("cosmo.png", 640), 12], 
  [@video.blank, 8]
]

script += [
  [@video.blank, 4],
  [@video.center_thumbnail("politan.png", 720), 8],
  [@video.center_thumbnail("politan.png", 800), 8], 
  [@video.center_thumbnail("politan.png", 840), 8], 
  [@video.blank, 4],
]

script += [
  [@video.search("Singapore skyline", TINT), 8],
  [@video.search("Madras skyline", TINT), 8],
  [@video.search("Baghdad skyline", TINT), 8],
  [@video.search("Los Angeles skyline", TINT), 40],

  [@video.search("Yokohama skyline", TINT), 8],
  [@video.search("Dhaka skyline", TINT), 8],
  [@video.search("Berlin skyline", TINT), 8],
  [@video.search("Alexandria skyline", TINT), 8],
  [@video.search("Bangalore skyline", TINT), 32],
]

script += [
  [@video.search("Singapore skyline", TINT), 8],
  [@video.search("Madras skyline", TINT), 8],
  [@video.search("Baghdad skyline", TINT), 8],
  [@video.search("Los Angeles skyline", TINT), 40],

  [@video.search("Yokohama skyline", TINT), 8],
  [@video.search("Dhaka skyline", TINT), 8],
  [@video.search("Berlin skyline", TINT), 8],
  [@video.search("Alexandria skyline", TINT), 8],
  [@video.search("Bangalore skyline", TINT), 32],
]

script += [[@video.blank, 100]]

@video.produce(script, "cosmopolitan.wav")
@video.play
