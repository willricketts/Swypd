class AccountsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    render :template => 'devise/passwords/edit', :locals => {:resource => current_user,:resource_name => User }
  end
  
  def show
    @user = current_user
    render '../views/devise/registrations/edit'
  end
  
  def edit
    @user = current_user
    render '../views/devise/registrations/edit'
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :controller => "dashboard", :action => "index", :notice => "Your account was updated."
    else
      render "edit"
    end
  end
end
