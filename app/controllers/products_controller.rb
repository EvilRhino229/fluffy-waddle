class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show]
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
    @product = Product.new
    @categories = Category.all.sort
  end

  def create
    @categories = Category.all.sort
    @product = Product.new(
                          name: params[:name],
                          description: params[:description],
                          price: params[:price],
                          category_id: params[:category_id],
                          image: params[:image]
      )
    if @product.save
      flash[:success] = "Nice, that merchandise is someone else's problem now."
      redirect_to "/products/#{@product.id}"
    else
      @categories = Category.all
      flash[:error] = "You goofed something!"
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.sort
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(
                   name: params[:name],
                   description: params[:description],
                   price: params[:price],
                   category_id: params[:category_id],
                   image: params[:image]
      )
      flash[:notice] = "You fixed that thing you goofed. Nice."
      redirect_to "/products/#{@product.id}"
    else
      flash[:error] = "Oops! An issue!"
      @categories = Category.all
      render 'edit'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:error] = "You exorcised the demon that has been tormenting you."
    redirect_to "/products"
  end
end