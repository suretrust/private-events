module EventsHelper
  def enrolled?(event)
    current_user.enrolled_events.exists?(event.id)
  end

  def verbose_time
    distance_of_time_in_words(@event.date, DateTime.now)
  end

  def validate_event_date
    if @event.date.today? || @event.date.future?
      render html: "The Event Will Start in #{verbose_time}"
    else
      render html: "This Event has been archieved"
    end
  end

end
