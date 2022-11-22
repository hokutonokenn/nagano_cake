class Public::HomesController < ApplicationController
  def top
    @items  = Item.all
    @genres = Genre.all
  end

  def about
    render :layout => 'about'
  end
end
