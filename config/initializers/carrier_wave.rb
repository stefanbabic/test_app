if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIHCA2V5K6JRABFAA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['test-app-97415']
  end
end