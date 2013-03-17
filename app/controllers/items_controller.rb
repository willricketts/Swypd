class ItemsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if user_signed_in?
      @items = current_user.items.all
    else
      redirect_to :controller => "home", :action => "index"
    end
  end
  
  def show
    @user = current_user
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
    @ownership = Ownership.new
  end
  
  def create
    @item = Item.new(params[:item])
        
    if @item.save
      @ownership = Ownership.new(:user_id => current_user.id, :item_id => @item.id)
      @ownership.save
      redirect_to items_path, :notice => "Item added."
      
    else
      render "new"
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to items_path, :notice => "Your item was updated."
    else
      render "edit"
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    @item.destroy
    redirect_to items_path, :notice => "Item deleted"
  end
end
