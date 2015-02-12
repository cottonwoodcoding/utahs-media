module ApplicationHelper
  def active_class(*controllers)
    if params[:action] == 'index'
      controllers.include?(params[:controller]) ? 'active' : ''
    else
      controllers.first == ("#{params[:controller]}/#{params[:action]}") ? 'active' : ''
    end
  end
end
