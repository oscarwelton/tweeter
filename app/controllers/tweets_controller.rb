class TweetsController < ApplicationController
  require 'openai'
  include ActionView::RecordIdentifier
  @@client = OpenAI::Client.new(access_token: ENV['OPENAI_KEY'])

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.generated_tweet = generate_tweet(@tweet).strip.gsub('"', '')
    @url = tweet_link(@tweet)

    if @tweet.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:tweet,
            partial: 'tweet',
            locals: { tweet: @tweet })
        end
      end
    end
  end

  def edit
    @tweet.find(params[:id])
  end

  def update
      @tweet = Tweet.find(params[:id])
      if @tweet.update(edit_params)
        @url = tweet_link(@tweet)
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
              'edit-tweet', partial: 'edited', locals: { tweet: @tweet }
            )
          end
        end
      else
        raise
      end
  end

  def generate_tweet(tweet)
    prompt = tweet_prompt(tweet)
    response = generate_tweet_response(prompt)
    response.empty? ? 'Sorry! Looks like something went wrong - please try again!' : response['choices'][0]['text']
  end

  def tweet_prompt(tweet)
    emoji_prompt = "The tweet should include the following keyword(s): #{tweet.keywords}. You must include at least one emoji. The tweet should have the following word(s) as hashtag(s) at the end of the tweet: #{tweet.hashtags}."
    no_emoji_prompt = "The tweet should include the following keyword(s): #{tweet.keywords}. The tweet should include the following as hashtag(s): #{tweet.hashtags}. Do not include any emojis."

    if tweet.emojis == 'true'
      "Please generate me a tweet about #{tweet.topic} with a #{tweet.tone} tone. My audience is #{tweet.audience} so please tailor your response accordingly. #{emoji_prompt}"
    else
      "Please generate me a tweet about #{tweet.topic} with a #{tweet.tone} tone. My audience is #{tweet.audience} so please tailor your response accordingly. #{no_emoji_prompt}"
    end
  end

  def generate_tweet_response(prompt)
    @@client.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt:,
        max_tokens: 1000,
        temperature: 1
      }
    )
  end

  def tweet_link(tweet)
    partial = tweet.generated_tweet.gsub(' ', '%20').gsub('#', '%23')
    "https://twitter.com/intent/tweet?text=#{partial}"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:topic, :tone, :keywords, :hashtags, :perspective, :audience, :emojis)
  end

  def edit_params
    params.require(:tweet).permit(:generated_tweet)
  end
end
