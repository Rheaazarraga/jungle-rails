class ProductsController < ApplicationController
  http_basic_authenticate_with name: ENV['JUNGLE_USERNAME'], password: ENV['JUNGLE_PASSWORD']

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
