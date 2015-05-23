namespace :aws do
  desc "get from s3"
  task :s3get do

    require 'aws-sdk'

    #provide AWS credentials
    s3 = Aws::S3::Resource.new(
      region: 'us-east-1',
      access_key_id: 'access_key_id',
      secret_access_key: 'secret_access_key'
    )

    #download files from S3
    s3.bucket('bucket').object('file.csv').get(response_target: 'file.csv')

  end

end
