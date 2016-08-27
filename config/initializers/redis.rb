# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)


uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

