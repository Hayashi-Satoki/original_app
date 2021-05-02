class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

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

  def search
    @pictures = Picture.search(params[:keyword])
  end

  def papafamily
    @pictures = Picture.where(family_id: [3, 4]).order("created_at DESC")
  end

  def papashow
    @picture = Picture.where(family_id: [3, 5])
    @pictures = Picture.where(family_id: [3, 4])
  end

  def mamafamily
    @pictures = Picture.where(family_id: [3, 5]).order("created_at DESC")
  end

  def mamashow
    @picture = Picture.where(family_id: [3, 5])
    @pictures = Picture.where(family_id: [3, 5])
  end

  private
  def pictures_params
    params.require(:picture).permit(:description, :family_id, :image).merge(user_id: current_user.id)
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
