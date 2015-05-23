#this works!!!

set :output, "log/cron_log.log"

every 2.minutes do
  runner "lib/assets/s3download.rb"
end
