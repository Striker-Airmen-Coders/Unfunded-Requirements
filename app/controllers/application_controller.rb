class ApplicationController < ActionController::Base
  def current_office
    current_user.try(:office)
  end

end
