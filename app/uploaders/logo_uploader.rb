# frozen_string_literal: true

class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w[jpg jpeg png]
  end

  process resize_to_fill: [200, 200]

  def size_range
    1..5.megabytes
  end

  version :thumb do
    process resize_to_fill: [50, 50]
  end
end
