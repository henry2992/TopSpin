# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)


uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:url => uri)