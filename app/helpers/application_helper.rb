module ApplicationHelper

  # These classes are added to body so CSS and JS can tell what Rails controller and action rendered the page,
  # so we can implement page-specific CSS and JS.
  def body_context_classes
    [controller_name, action_name, @additional_body_classes].join(" ")
  end

end
