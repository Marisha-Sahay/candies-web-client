class CandiesController < ApplicationController

  def index
    # i = 0
    @candies = []
    @candies_hash = Unirest.get("#{ENV['DOMAIN']}/candies.json").body
    @candies_hash.each do |candy|
      @candies << Candy.new(candy)
      # i += 1
    end
  end

  def show
    candy_hash = Unirest.get("#{ENV['DOMAIN']}/candies/#{params[:id]}.json").body
    @candy = Candy.new(candy_hash)
  end

  def new
  end

  def create
    @candy = Unirest.post("#{ENV['DOMAIN']}/candies.json", parameters: {name: params[:name], price: params[:price], expiry: params[:expiry]}).body
    redirect_to "/candies/#{@candy['id']}"
  end

  def edit
    @candy = Unirest.get("#{ENV['DOMAIN']}/candies/#{params[:id]}.json").body
  end

  def update
    @candy = Unirest.patch("#{ENV['DOMAIN']}/candies/#{params[:id]}.json", parameters: {name: params[:name], price: params[:price], expiry: params[:expiry]}).body
    redirect_to "/candies/#{@candy['id']}"
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/candies/#{params[:id]}.json").body
    redirect_to "/candies"
  end
end