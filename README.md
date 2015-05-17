# awsDownload

## 'aws-sdk' gem

This toy app downloads a file from Amazon S3 via the lib/assets/s3download.rb file using the 'aws-sdk' gem.

The code in this file is:

```Ruby
#!/usr/bin/env ruby

require 'aws-sdk'

s3 = Aws::S3::Resource.new(
  region: 'us-east-1',
  access_key_id: 'ACCESS_KEY',
  secret_access_key: 'SECRET_KEY'
)

s3.bucket('jdstore').object('statlines.csv').get(response_target: 'lib/assets/db/stats.csv')
'''

## 'whenever' gem

There is a cron job setup via the 'whenever' gem to run this file on a schedule via the config/schedule.rb file.

Setup 'whenever' using the command `wheneverize .`.

The code in this file is:

```Ruby
set :output, "log/cron_log.log"

every 2.minutes do
  runner "lib/assets/s3download.rb"
end
```

After the cron job is set up in the schedule file, you can ensure it is correct using normal cron commands form the command line. Check the job using `crontab -l`. Finally, update the actual cron file using the command `whenever -i`.

That's it!
