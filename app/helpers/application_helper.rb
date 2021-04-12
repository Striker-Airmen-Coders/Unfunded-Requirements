module ApplicationHelper
    def sortable(column, titel = nil)
        title ||= column.titleize
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link_to title, {:sort => column, :direction => direction}
    end
    def current_office
      current_user.try(:office)
    end

end
