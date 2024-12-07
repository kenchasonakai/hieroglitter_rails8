CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              "AWS",
    aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: "ap-northeast-1"
  }
  config.fog_directory  = "hieroglitter-images"
  config.fog_public = false
end