class PagesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :type, :fma, :unit]
  def home
  end

  def type
    
  end

  def fma
  end

  def unit
  end

  def edit
  end
end
