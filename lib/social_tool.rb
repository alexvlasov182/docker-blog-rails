module SocialTool
  def self.twitter_search
    client = Tweetkit::Client.new do |config|
      config.bearer_token        = ENV.fetch('TWITTER_BEARER_TOKEN_HERE')
      config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
      config.consumer_secret     = ENV.fetch('TWITTER_CONSUMER_SECRET')
    end
    client.search('#uxdesign').take(6).collect do |tweet|
      "#{tweet}: #{tweet.text}"
    end
  end
end