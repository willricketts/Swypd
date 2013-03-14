class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    @items = current_user.items.all
    @stolenitems = current_user.items.find(:all, :conditions => {:stolen => true})
  end
  
end
