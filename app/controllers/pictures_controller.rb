class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @pictures = Picture.all.includes(:user).order("created_at DESC")
  end

  def new
    @picture = Picture.new
  end
   
  def create
    Picture.create(pictures_params)
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
  end

  def edit
  end

  def update
    picture = Picture.find(params[:id])
    picture.update(pictures_params)
  end

  def show
    @comment = Comment.new
    @comments = @picture.comments.includes(:user)
  end

  private
  def pictures_params
    params.require(:picture).permit(:description, :family_id).merge(user_id: current_user.id)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
