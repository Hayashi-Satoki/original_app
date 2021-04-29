class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
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
    @picture = Picture.find(params[:id])
  end

  def update
    picture = Picture.find(params[:id])
    picture.update(pictures_params)
  end


  private
  def pictures_params
    params.require(:picture).permit(:description, :family_id)
  end

end
