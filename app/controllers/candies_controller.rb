class CandiesController < ApplicationController

  def index
    @candies = Unirest.get("#{ENV['DOMAIN']}/candies.json").body
  end

  def show
    @candy = Unirest.get("#{ENV['DOMAIN']}/candies/#{params[:id]}.json").body
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