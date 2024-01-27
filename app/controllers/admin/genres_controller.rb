class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを登録しました"
      redirect_to request.referer
    else
      @genres = Genre.all
      flash.now[:alert] = "登録に失敗しました"
      render :index
      @genre = Genre.new
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを更新しました"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "ジャンルを削除しました"
    redirect_to request.referer
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

end
