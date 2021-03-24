module ApplicationHelper
  def sortable(column, titel = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}
  end

  def flash_color(flash_type)
    case flash_type
    when 'success'
      'green'
    when 'error'
      'red'
    when 'alert'
      'yellow'
    else
      'blue'
    end
  end
end
