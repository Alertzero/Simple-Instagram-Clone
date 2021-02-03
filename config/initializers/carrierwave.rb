CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     ENV['aws_access_key_id'],       # required
        aws_secret_access_key: ENV['aws_secret_access_key'],   # required
        region:            ENV.fetch('AWS_REGION') # Required
        
    }


    if Rails.env.development?
        config.storage = :file
        config.enable_processing = true
      else
        config.storage = :fog
      end
  
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    # For testing, upload files to local `tmp` folder.
    config.permissions = 0644
    config.directory_permissions = 0700
    config.fog_directory = ENV['FOG_DIRECTORTY']
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  end