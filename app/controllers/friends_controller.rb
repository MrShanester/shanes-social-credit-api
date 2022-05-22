class FriendsController < ApplicationController

  def index
    friends = Friend.all
    render json: friends.as_json
  end

  def show
    friend = Friend.find_by(id: params[:id])
    render json: friend.as_json
  end

  def create
    friend = Friend.new(
      name: params[:name],
      description: params[:description],
      score: params[:score]
    )
    if friend.save
      render json: friend.as_json
    else
      render json: {error: "Failed to create new friend"}
    end
  end

  def update
    friend = Friend.find_by(id: params[:id])
    friend.name = params[:name] || friend.name
    friend.description = params[:description] || friend.description
    friend.score = params[:score] || friend.score
    if friend.save 
      render json: friend.as_json
    else
      render json: {error: "Failed to update user"}
    end
  end

  def destroy
    friend = Friend.find_by(id: params[id:])
    if friend.delete
      render json: {message: "Friend deletion successful"}
    else 
      render json: {error: "Failed to delete friend"}
    end
  end
end
