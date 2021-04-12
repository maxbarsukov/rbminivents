module RbMinivents
  class Event

    def initialize
      @events = Hash.new
    end

    # On: listen to events
    def on(type, &prc)
      @events[type.to_sym] = prc if block_given?

      self
    end

    # Off: stop listening to event / specific callback
    def off(type)
      sym = type.to_sym
      if @events.has_key?(sym)
        @events.delete(sym)
      end

      self
    end

    # Emit: send event, callbacks will be triggered
    def emit(type)
      sym = type.to_sym
      if @events.has_key?(sym)
        @events[sym].call
        @events.delete(sym)
      end

      self
    end
  end
end
