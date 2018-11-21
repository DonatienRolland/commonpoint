class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  # process convert: 'jpg'
  process :resize_to_fill => [200]


  def extension_whitelist
    %w{ jpg jpeg png }
  end

  def filename
    "#{mounted_as}.jpg" if original_filename
  end

  version :bright_face do
    cloudinary_transformation radius: 50,
      width: 50, height: 50, crop: :thumb, gravity: :face
  end

end
