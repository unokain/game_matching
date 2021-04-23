class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
   # MiniMagickをincludeすると画像サイズ調整ができるようになる
   # 保存形式の設定。他に使うものとしてはfog形式などがある。
  storage :fog
  process :resize_to_limit => [300, 300] # 画像サイズの調整
  # 画像ファイルの保存先の設定
  # 保存先を指定するには `store_dir` というメソッドに定義します。
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end