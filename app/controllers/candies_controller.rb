class CandiesController < ApplicationController

  def index
    @candies = Unirest.get("http://localhost:3000/api/v1/candies.json").body
  end

  def show
    @candy = Unirest.get("http://localhost:3000/api/v1/candies/#{params[:id]}.json").body
  end

  def new
  end

  def create
    @candy = Unirest.post("http://localhost:3000/api/v1/candies.json", parameters: {name: params[:name], price: params[:price], expiry: params[:expiry]}).body
    redirect_to "/candies/#{@candy['id']}"
  end

  def edit
    @candy = Unirest.get("http://localhost:3000/api/v1/candies/#{params[:id]}.json").body
  end

  def update
    @candy = Unirest.patch("http://localhost:3000/api/v1/candies/#{params[:id]}.json", parameters: {name: params[:name], price: params[:price], expiry: params[:expiry]}).body
    redirect_to "/candies/#{@candy['id']}"
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/candies/#{params[:id]}.json").body
    redirect_to "/candies"
  end
end