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

fps = 115.0 / 60 * 16  # 115 bpm, 16 frames per beat

audio_path = "cosmopolitan.wav"

create_video([ 
  ["contxt_padded_560.jpg", 8], 
  ["contxt_padded_600.jpg", 4], 
  ["contxt_padded_640.jpg", 4], 
  ["contxt_padded_680.jpg", 8], 
  ["contxt_padded_720.jpg", 16], 
  ["contxt_padded_760.jpg", 8], 
  ["contxt_padded_800.jpg", 8], 
  ["contxt_padded_840.jpg", 8], 

  ["contxt_padded_560.jpg", 8], 
  ["contxt_padded_600.jpg", 4], 
  ["contxt_padded_640.jpg", 4], 
  ["contxt_padded_680.jpg", 8], 
  ["contxt_padded_720.jpg", 16], 
  ["contxt_padded_760.jpg", 8], 
  ["contxt_padded_800.jpg", 8], 
  ["contxt_padded_840.jpg", 8], 

  ["cosmo_padded_560.png", 8], 
  ["cosmo_padded_600.png", 4], 
  ["cosmo_padded_640.png", 4], 
  ["cosmo_padded_680.png", 8], 
  ["cosmo_padded_720.png", 16], 
  ["cosmo_padded_760.png", 8], 
  ["cosmo_padded_800.png", 8], 
  ["cosmo_padded_840.png", 8], 

  ["politan_padded_560.png", 8], 
  ["politan_padded_600.png", 4], 
  ["politan_padded_640.png", 4], 
  ["politan_padded_680.png", 8], 
  ["politan_padded_720.png", 16], 
  ["politan_padded_760.png", 8], 
  ["politan_padded_800.png", 8], 
  ["politan_padded_840.png", 8],  

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