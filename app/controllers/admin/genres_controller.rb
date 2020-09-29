class Admin::GenresController < ApplicationController
  before_action :authenticate_user!


  def new
    @genre = Genre.new
  end

  def create 
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:medical_department)
  end

end
