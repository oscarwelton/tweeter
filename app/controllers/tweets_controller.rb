class TweetsController < ApplicationController
  require "openai"
  @@client = OpenAI::Client.new(access_token: "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")

  def home
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end

  def show
    tweet = Tweet.find(params[:id])
    @tweet = generate_tweet(tweet)
  end

  def generate_tweet(tweet)

    if tweet.emojis == "true"
      tweet_prompt = "Please generate me a tweet about #{tweet.topic}
      with a #{tweet.tone} tone. My audience is #{tweet.audience} so please tailor your response accordingly.
        The tweet should include the following keyword(s):
      #{tweet.keywords}. You must include at least one emoji.
      The tweet should have the following word(s) as hashtag(s) at the end
      of the tweet: #{tweet.hastags}."
    else
      tweet_prompt = "Please generate me a tweet about #{tweet.topic}
      with a #{tweet.tone} tone. My audience is #{tweet.audience} so please tailor your response accordingly.
        The tweet should include the following keyword(s):
      #{tweet.keywords}.The tweet should include the following as hashtag(s): #{tweet.hastags}.
      Do not include any emojis."
    end

      tweet_response = @@client.completions(
      parameters: {
          model: "text-davinci-003",
          prompt: tweet_prompt,
          max_tokens: 1000,
          temperature: 1,
      })

      if tweet_response == []
        return "hello"
      else
        return tweet_response['choices'][0]['text']
      end
  end


  private


  def tweet_params
    params.require(:tweet).permit(:topic, :tone, :keywords, :hashtags, :perspective, :audience, :emojis, :tweet)
  end

end
