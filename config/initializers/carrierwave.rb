CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      use_iam_profile:       true,                         # optional, defaults to false
      region:                'ap-northeast-1',
    }
    config.fog_directory  = 'reword'                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file
  else
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end
end