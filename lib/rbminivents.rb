module RbMinivents
  class Events

    def initialize
      @handlers = {}
    end

    # On: listen to events
    def on(name, &handler)
      @handlers[name] ||= []
      @handlers[name] << handler
      handler
    end

    # Off: stop listening to event / specific callback
    def off(name, handler)
      @handlers[name] ||= []
      @handlers[name].delete(handler)
    end

    # Emit: send event, callbacks will be triggered
     def emit(name, *args)
      @handlers[name] ||= []
      @handlers[name].map { |handler| handler.call(*args) }
    end
  end
end
