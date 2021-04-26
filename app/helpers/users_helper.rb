module UsersHelper
  def lineage(current_user)
    if current_user.unit != nil
      current_user.unit
    elsif current_user.grp != nil
      current_user.grp
    elsif current_user.wing != nil
      current_user.wing
    else 
      current_user.installation
    end
  end
end


