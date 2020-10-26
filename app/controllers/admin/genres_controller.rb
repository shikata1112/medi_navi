class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update, :destroy]

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
  end

  def update
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:medical_department)
  end

end
