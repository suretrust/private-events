module ApplicationHelper

  def show_header_if_user_logged_in
    render 'header' if logged_in?
  end

  def print_errors_if_any(object)
    render 'errors' if object.errors.any?
  end

end
