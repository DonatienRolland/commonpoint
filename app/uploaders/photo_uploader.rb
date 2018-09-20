class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave


  version :bright_face do
    cloudinary_transformation radius: 50,
      width: 50, height: 50, crop: :thumb, gravity: :face
  end
end
