class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:info ]
  def home
  end

  def create
  end

  def type
    
  end

  def fma
  end

  def unit
  end

  def info
  end

  def shipyard
  end

end
