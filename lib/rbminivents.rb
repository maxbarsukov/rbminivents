module RbMinivents
  class Events

    def initialize
      @events = Hash.new
    end

    # On: listen to events
    def on(type, &prc)
      sym = type.to_s.to_sym

      @events[sym] = prc if block_ given?
      self
    end

    # Off: stop listening to event / specific callback
    def off(type)
      sym = type.to_s.to_sym

      if @events.has_key?(sym)
        @events.delete(sym)
      end

      self
    end

    # Emit: send event, callbacks will be triggered
    def emit(type, args = nil)
      sym = type.to_s.to_sym

      if @events.has_key?(sym)
        @events[sym].call(*args)
        @events.delete(sym)
      end

      self
    end
  end
end
