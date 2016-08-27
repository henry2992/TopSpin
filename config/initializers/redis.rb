# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)


uri = URI.parse(ENV["REDISTOGO_URL"])

Resque.redis = Redis.new(:url => uri)