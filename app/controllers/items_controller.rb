class ItemsController < ApplicationController

  before_filter :find_by_id, only: [:show, :edit, :update, :destroy]

  def index
    #items = Item.all
    #render text: items.map { |i| "#{i.name} - #{i.price}"}.join("<br/>")
    
    @items = Item.all
  end

  # /items/1 GET
  def show
    unless @item
      render text: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  #/items POST
  def create
    #item = Item.create(name: params[:name], price: params[:price], description: params[:description],
    #                   weight: params[:weight], real: params[:real])
    #render text: "#{item.id}. #{item.name}: #{item.price}" 

    @item = Item.create(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/1 PUT
  def update
    @item.update_attributes(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end
  
  def find_by_id
    @item = Item.find(params[:id])
  end
end
