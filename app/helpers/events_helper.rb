module EventsHelper
  def enrolled?(event)
    current_user.enrolled_events.exists?(event.id)
  end
end
