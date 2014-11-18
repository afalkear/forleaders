class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def new
    
  end
  
  def create
  end

  def update
    
  end

  def destroy
    
  end

end