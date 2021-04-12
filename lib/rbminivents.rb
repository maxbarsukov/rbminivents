module RbMinivents
  class Event
    @events = {}
    @empty = []

    # On: listen to events
    def on(type, &prc)
      @events[type] = prc
      self
    end

    # Off: stop listening to event / specific callback
    def off(type)
      if @events.has_key?(type)
        @events.delete(type)
      end
      self
    end

    # Emit: send event, callbacks will be triggered
    def emit(type)
      if @events.has_key?(type)
        @events[type].call
        @events.delete(type)
      end

      self
    end
  end
end
