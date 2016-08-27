# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)


uri = URI.parse( "redis://redistogo:eaa7cf96563555c4b4609431fbef5e35@viperfish.redistogo.com:11570" || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

