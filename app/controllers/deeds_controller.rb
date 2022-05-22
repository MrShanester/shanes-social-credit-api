class DeedsController < ApplicationController
  def show
    deed = Deed.find_by(id: params[:id])
    render json: deed.as_json
  end

  def index
    deeds = Deed.all 
    render json: deeds.as_json
  end

  def create
    deed = Deed.new(
      deed: params[:deed],
      description: params[:description],
      good: params[:good],
      friend_id: params[:friend_id]
    )
    if deed.save
      render json: deed.as_json
    else
      render json: {error: "Failure to create deed"}
    end
  end

  def update
    deed = Deed.find_by(id: params[:id])
    deed.deed = params[:deed] || deed.deed
    deed.description = params[:description] || deed.description
    deed.good = params[:good] || deed.good
    deed.friend_id = params[:friend_id] || deed.friend_id
    if deed.save
      render json: deed.as_json
    else
      render json: {error: "Failure to update deed"}
    end
  end

  def destroy
    deed = Deed.find_by(id: params[:id])
    if deed.delete
      render json: {message: "Deed deleted"}
    else 
      render json: {error: "Deed unable to be deleted"}
  end

end
