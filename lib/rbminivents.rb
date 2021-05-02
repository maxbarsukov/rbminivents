module RbMinivents
  class Events

    def initialize
      @events = Hash.new
    end

    # On: listen to events
    def on(type, &prc)
      sym = sym(type)
      (@events[sym] ||= []).push(prc) if block_given?
      self
    end

    # Off: stop listening to event / specific callback
    def off(type, &prc)
      s = sym(type)

      if @events.has_key?(s)
        if block_given?
          @events[s].delete(prc)
        else
          @events[s] = []
        end
      end

      self
    end

    # Emit: send event, callbacks will be triggered
    def emit(type, *args)
      s = sym(type)

      if @events.has_key?(s)
        @events[s].each { |f| f.call(*args) }
      end

      self
    end

    private

    def sym(o)
      o.to_s.to_sym
    end

  end
end

class String

  def remove_lines(i)
    split("\n")[i..-1].join("\n")
  end

end
