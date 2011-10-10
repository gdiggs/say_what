class SayWhat
  def call(env)
    [200, {"Content-Type"=> "text/plain"}, ["It's all in the back."]]
  end
end

run SayWhat.new

# Create background thread to parse twitter feed and push to redis
Thread.new {
  loop do
    puts "oh hey."
    sleep 5
  end
}

