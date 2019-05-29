module EventsHelper
  def enrolled?(event)
    current_user.enrolled_events.exists?(event.id)
  end

  def verbose_time
    distance_of_time_in_words(@event.date, DateTime.now)
  end

end
