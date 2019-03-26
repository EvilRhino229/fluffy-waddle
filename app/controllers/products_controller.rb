class ProductsController < ApplicationController
  def index

    if params[:category_id] && Category.ids.include?(params[:category_id].to_i)
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all.order(id: :asc)
    end

    @categories = Category.all.sort
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @categories = Category.all.sort
  end

  def create
    product = Product.new(
                          name: params[:name],
                          description: params[:description],
                          price: params[:price],
                          category_id: params[:category_id],
                          image_url: params[:image_url]
      )
    product.save
    flash[:success] = "Nice, that merchandise is someone else's problem now."
    redirect_to "/products/#{product.id}"
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.sort
  end

  def update
    product = Product.find(params[:id])
    product.update(
                   name: params[:name],
                   description: params[:description],
                   price: params[:price],
                   category_id: params[:category_id],
                   image_url: params[:image_url]
      )
    flash[:notice] = "You fixed that thing you goofed. Nice."
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:error] = "You exorcised the demon that has been tormenting you."
    redirect_to "/products"
  end
end