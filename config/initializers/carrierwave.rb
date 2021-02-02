CarrierWave.configure do |config|
    config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     ENV['aws_access_key_id'],       # required
        aws_secret_access_key: ENV['aws_secret_access_key'],   # required
    }
  
    # For testing, upload files to local `tmp` folder.
    config.storage = :fog
    config.permissions = 0666
    config.cache_dir = "#{Rails.root}/tmp/"                  # To let CarrierWave work on heroku
    config.fog_directory    = ENV['FOG_DIRECTORTY']
    config.fog_attributes = {'Cache-Control' => "max-age=#{365.day.to_i}"}                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  end