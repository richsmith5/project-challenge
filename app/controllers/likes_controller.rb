class LikesController < ApplicationController
  before_action :find_dog
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = 'You Have Already Liked This Puppy'
    else
      @dog.likes.create(like_params)
    end
    redirect_to dog_path(@dog)
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_to dog_path(@dog)
  end

  private

  def find_dog
    @dog = Dog.find(params[:dog_id])
  end

  def find_like
    @like = @dog.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, dog_id:
    params[:dog_id]).exists?
  end

  def like_params
    params.permit(:user).merge(user_id: current_user.id)
  end
end
