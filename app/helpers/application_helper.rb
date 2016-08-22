module ApplicationHelper
  def nav(controller,action)
    controller_name==controller && action_name==action ? ' class=active' : ''
  end
end
