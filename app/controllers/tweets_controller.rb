class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end

  def index
    @tweets = Tweet.order(:created_at => 'desc')
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: '投稿を受け付けました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: '編集を受け付けました'
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  def tweets_params
    params.require(:tweet).permit(:content)
  end
end
