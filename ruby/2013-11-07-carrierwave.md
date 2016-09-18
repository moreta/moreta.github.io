---
title: "Carrierwave"
date: 2013-11-07
tags: rmagick, carrierwave, rails, image, fog
---


<http://noodles-mtb.hatenablog.com/entry/2013/07/08/151316>

## API

<http://rubydoc.info/github/jnicklas/carrierwave/CarrierWave/RMagick:resize_to_fill>


## widthだけ調整したい場合

<http://stackoverflow.com/questions/7194421/rails-3-0-carrierwave-and-resize-to-a-specific-width>
<http://stackoverflow.com/questions/8570181/carrierwave-resizing-images-to-fixed-width>


`process :resize_to_limit => [500, 0]`




# image recreate

<https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Recreate-and-reprocess-your-files-stored-on-fog>

```
YourModel.all.each do |ym|
  begin
    ym.process_your_uploader_upload = true # only if you use carrierwave_backgrounder
    ym.your_uploader.cache_stored_file!
    ym.your_uploader.retrieve_from_cache!(ym.your_uploader.cache_name)
    ym.your_uploader.recreate_versions!
    ym.save!
  rescue => e
    puts  "ERROR: YourModel: #{ym.id} -> #{e.to_s}"
  end
end
```

## version & version filename

<https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Customize-your-version-file-names>


``` ruby
class LogoUploader < CarrierWave::Uploader::Base
  # ...
  def filename
    "original.#{model.logo.file.extension}" if original_filename
  end
  version :small do
    process :resize_to_fit => [190, 190]
    process :convert => 'png'
  end
  version :icon do
    process :resize_to_fill => [50, 50]
    process :convert => 'png'
  end
  # ...
end
```

*original_small.png* or *original_icon.png*

もし、直接ファイル名を指定した場合には

``` ruby
def filename
  "original.#{model.logo.file.extension}" if original_filename
end
version :small do
  process :resize_to_limit => [190,190]
  process :convert => 'png'
  def full_filename (for_file = model.logo.file)
    "small.png"
  end
end
version :icon do
  process :resize_to_fill => [50,50]
  process :convert => 'png'
  def full_filename (for_file = model.logo.file)
    "icon.png"
  end
end
```

### fog

