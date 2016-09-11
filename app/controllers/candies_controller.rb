class CandiesController < ApplicationController

  def index
    @candies = Candy.all
  end

  def show
    @candy = Candy.find(params[:id])
  end

  def new
  end

  def create
    @candy = Candy.create(name: params[:name], price: params[:price], expiry: params[:expiry])
    redirect_to "/candies/#{@candy.id}"
  end

  def edit
    @candy = Unirest.get("#{ENV['DOMAIN']}/candies/#{params[:id]}.json").body
  end

  def update
    @candy = Unirest.patch("#{ENV['DOMAIN']}/candies/#{params[:id]}.json", parameters: {name: params[:name], price: params[:price], expiry: params[:expiry]}).body
    redirect_to "/candies/#{@candy['id']}"
  end

  def destroy
    @candy = Candy.find(params[:id])
    @candy.destroy
    redirect_to "/candies"
  end

end