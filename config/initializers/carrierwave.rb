CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
    config.storage = :fog
    config.cache_dir = "#{Rails.root}/tmp/"
    config.fog_credentials = {
      provider:              Rails.application.credentials.fog[:provider],                        # required
      aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region:                Rails.application.credentials.fog[:region],
    }
    config.fog_directory  = Rails.application.credentials.fog[:directory]                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
  else
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end
end