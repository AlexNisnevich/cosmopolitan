require_relative 'search.rb'
require_relative 'sequence.rb'

fps = 115.0 / 60 * 16  # 115 bpm, 16 frames per beat
audio_path = "cosmopolitan.wav"

system("padding.sh")

search_for_skylines([
  "Bombay", "Jakarta", "Karachi", "Moscow",
  "Istanbul", "MexicoCity", "Shanghai", "Tokyo", 
  "NewYork", "Bangkok", "Beijing", "Delhi",
  "London", "HongKong", "Cairo", "Tehran",
  "Bogota", "Bandung", "Tianjin", "Lima",
  "RioDeJaneiro", "Lahore", "Bogor", "Santiago",
  "StPetersburg", "Shenyang", "Calcutta", "Wuhan",
  "Sydney", "Guangzhou"
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
  ["black.png", 8],

  ["processed_images/London.png", 24], 
  ["black.png", 8],

  ["processed_images/HongKong.png", 24], 
  ["black.png", 8],

  ["processed_images/Cairo.png", 24], 
  ["black.png", 8],

  ["processed_images/Tehran.png", 24], 
  ["black.png", 8],

  ["processed_images/Bogota.png", 24], 
  ["black.png", 8],

  ["processed_images/Bandung.png", 24], 
  ["black.png", 8],

  ["processed_images/Tianjin.png", 24], 
  ["black.png", 8],

  ["processed_images/Lima.png", 24], 
  ["black.png", 8],

  ["processed_images/RioDeJaneiro.png", 24], 
  ["black.png", 8],

  ["processed_images/Lahore.png", 24], 
  ["black.png", 8],

  ["processed_images/Bogor.png", 24], 
  ["black.png", 8],

  ["processed_images/Santiago.png", 24], 
  ["black.png", 8],

  ["processed_images/StPetersburg.png", 24], 
  ["black.png", 8],

  ["processed_images/Shenyang.png", 24], 
  ["black.png", 8],

  ["processed_images/Calcutta.png", 24], 
  ["black.png", 8],

  ["processed_images/Wuhan.png", 24], 
  ["black.png", 8],

  ["processed_images/Sydney.png", 24], 
  ["black.png", 8],

  ["processed_images/Guangzhou.png", 24], 
  ["black.png", 8], 

  ["padded/cosmo_padded_560.png", 12],  
  ["padded/cosmo_padded_640.png", 12], 
  ["black.png", 8], 

  ["black.png", 8],
  ["padded/politan_padded_720.png", 8],
  ["padded/politan_padded_800.png", 8], 
  ["padded/politan_padded_840.png", 8], 

  ["black.png", 100]
], fps, audio_path)