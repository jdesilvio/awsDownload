#!/usr/bin/env ruby

require 'aws-sdk'

s3 = Aws::S3::Resource.new(
  region: 'us-east-1',
  access_key_id: 'ACCESS_KEY',
  secret_access_key: 'SECRET_KEY'
)

s3.bucket('jdstore').object('statlines.csv').get(response_target: 'lib/assets/db/stats.csv')
