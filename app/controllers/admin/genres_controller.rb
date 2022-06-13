class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to 
  end 
  
  def edit
  end 
  
  def update
  end 
  
  
end
