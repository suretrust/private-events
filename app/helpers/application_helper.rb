module ApplicationHelper

  def show_header_if_user_logged_in
    render 'header' if logged_in?
  end

end
