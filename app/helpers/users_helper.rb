module UsersHelper
  def lineage(current_user)
    if current_user.unit != nil
      current_user.unit
    elsif current_user.group != nil
      current_user.group
    elsif current_user.wing != nil
      current_user.wing
    else 
      current_user.installation
    end
  end
end


