class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update, :destroy]

  def new
    @genre = Genre.new
  end

  def create 
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:genre_create] = "診療科目を登録しました。"
      redirect_to admin_genres_path
    else
      flash[:genre_create_failure] = "診療科目名が空欄またはすでに登録されています。"
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @genres = Genre.all
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:genre_edit] = "診療科目を更新しました。"
    else
      flash[:genre_edit_failure] = "診療科目名が空欄またはすでに登録されています。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @genre.destroy
    flash[:genre_destroy] = "診療科目を削除しました。"
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
