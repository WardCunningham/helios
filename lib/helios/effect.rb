module Helios
  class Effect

    def change!
      raise NotImplementedError("Effects must implement #change! method")
    end

    protected
    def get_lights(value)
      if value.is_a?(Array)
        # [0, '..', 512]
        if value[1] == '..'
          return (value[0].to_i..value[2].to_i)
        end
        return value.map(&:to_i)
      end
      return value
    end
  end
end
