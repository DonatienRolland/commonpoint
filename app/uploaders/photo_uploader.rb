class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  # process convert: 'jpg'
  process :resize_to_fill => [100]



  version :bright_face do
    cloudinary_transformation radius: 50,
      width: 50, height: 50, crop: :thumb, gravity: :face
  end
end
