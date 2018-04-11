class StaticPagesController < ApplicationController
  def home
    @products = Product.all
  end

  def search
    @products = Product.search(params[:search]).order("created_at DESC")
  end

  def display
    @products = Product.all
  #  @products = Product.search(params[:search]).order("created_at DESC")
    
    if params[:search]
         @products = Product.search(params[:search]).order("created_at DESC")
      else
         @products = Product.all.order('created_at DESC')
      end
    
    
  end
end
