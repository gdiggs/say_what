require 'bundler'
Bundler.require

INTERVAL = 60 # wait 1 minute between checking calls
PER_PAGE = 20 # get at most 20 items per request
SEARCH_TERMS = ["it makes me so happy"]
EXCLUDE_TERMS = ["http", "@", "#"]

class SayWhat
  def call(env)
    [200, {"Content-Type"=> "text/plain"}, ["It's all in the back."]]
  end
end

class TwitterHelper
  def self.link(tweet)
    "http://www.twitter.com/#{tweet.from_user}/status/#{tweet.id_str}"
  end
end

run SayWhat.new

# Create background thread to parse twitter feed and push to redis
Thread.new {
  last_id = 0 # start by getting latest tweets

  loop do
    # set up search terms
    search = Twitter::Search.new.result_type("recent").no_retweets.per_page(PER_PAGE)
    SEARCH_TERMS.each{ |term| search.phrase(term) }
    EXCLUDE_TERMS.each{ |term| search.exclude(term) }

    # get the results since the last time we fetched
    results = search.since_id(last_id).fetch

    # print the results if there are any, otherwise do nothing
    if results.any?
      puts "*** Found #{results.count} results"

      results.each do |result|
        puts "@#{result.from_user}: #{result.text} - #{TwitterHelper.link(result)}"
      end

      last_id = results.first.id # update with the new last id
    else
      puts "*** no results."
    end
    
    # sleep before doing it again
    puts "*** sleeping for #{INTERVAL} seconds."
    sleep INTERVAL
  end
}

