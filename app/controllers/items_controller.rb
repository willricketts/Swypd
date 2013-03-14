class ItemsController < ApplicationController
  
  def index
    @items = current_user.items.all
  end
  
  def show
    @item = current_user.item.find(params[:id])
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
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
