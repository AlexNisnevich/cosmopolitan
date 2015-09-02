require_relative 'search.rb'
require_relative 'sequence.rb'

fps = 115.0 / 60 * 16  # 115 bpm, 16 frames per beat
audio_path = "cosmopolitan.wav"

system("padding.sh")

search_for_skylines([
  "Bombay", "Jakarta", "Karachi", "Moscow",
  "Istanbul", "MexicoCity", "Shanghai", "Tokyo", 
  "NewYork", "Bangkok", "Beijing", "Delhi"
])

create_video([ 
  ["padded/contxt_padded_560.jpg", 8], 
  ["padded/contxt_padded_600.jpg", 4], 
  ["padded/contxt_padded_640.jpg", 4], 
  ["padded/contxt_padded_680.jpg", 8], 
  ["padded/contxt_padded_720.jpg", 16], 
  ["padded/contxt_padded_760.jpg", 8], 
  ["padded/contxt_padded_800.jpg", 8], 
  ["padded/contxt_padded_840.jpg", 8], 

  ["padded/contxt_padded_560.jpg", 8], 
  ["padded/contxt_padded_600.jpg", 4], 
  ["padded/contxt_padded_640.jpg", 4], 
  ["padded/contxt_padded_680.jpg", 8], 
  ["padded/contxt_padded_720.jpg", 16], 
  ["padded/contxt_padded_760.jpg", 8], 
  ["padded/contxt_padded_800.jpg", 8], 
  ["padded/contxt_padded_840.jpg", 8], 

  ["padded/cosmo_padded_560.png", 8], 
  ["padded/cosmo_padded_600.png", 4], 
  ["padded/cosmo_padded_640.png", 4], 
  ["padded/cosmo_padded_680.png", 8], 
  ["padded/cosmo_padded_720.png", 16], 
  ["padded/cosmo_padded_760.png", 8], 
  ["padded/cosmo_padded_800.png", 8], 
  ["padded/cosmo_padded_840.png", 8], 

  ["padded/politan_padded_560.png", 8], 
  ["padded/politan_padded_600.png", 4], 
  ["padded/politan_padded_640.png", 4], 
  ["padded/politan_padded_680.png", 8], 
  ["padded/politan_padded_720.png", 16], 
  ["padded/politan_padded_760.png", 8], 
  ["padded/politan_padded_800.png", 8], 
  ["padded/politan_padded_840.png", 8],  

  ["processed_images/Bombay.png", 24], 
  ["black.png", 8], 

  ["processed_images/Jakarta.png", 24], 
  ["black.png", 8], 

  ["processed_images/Karachi.png", 24], 
  ["black.png", 8], 

  ["processed_images/Moscow.png", 24], 
  ["black.png", 8], 

  ["processed_images/Istanbul.png", 24], 
  ["black.png", 8], 

  ["processed_images/MexicoCity.png", 24], 
  ["black.png", 8], 

  ["processed_images/Shanghai.png", 24], 
  ["black.png", 8],

  ["processed_images/Tokyo.png", 24], 
  ["black.png", 8],

  ["processed_images/NewYork.png", 24], 
  ["black.png", 8],

  ["processed_images/Bangkok.png", 24], 
  ["black.png", 8],

  ["processed_images/Beijing.png", 24], 
  ["black.png", 8],

  ["processed_images/Delhi.png", 24], 
  ["black.png", 8]
], fps, audio_path)