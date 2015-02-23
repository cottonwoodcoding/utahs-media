module ApplicationHelper
  def active_class(*controllers)
    if params[:action] == 'index'
      controllers.include?(params[:controller]) ? 'active' : ''
    else
      controllers.first == ("#{params[:controller]}/#{params[:action]}") ? 'active' : ''
    end
  end

  def flash_class(level)
    case level
      when :notice then
        'info'
      when :error then
        'error'
      when :alert then
        'warning'
    end
  end
end
