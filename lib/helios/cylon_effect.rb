module Helios
  class CylonEffect < Effect
    RED = [255,0,0]
    BLACK = [0,0,0]

    def initialize(args = {})
      lights = args.fetch('lights', [1, '..', 25])
      @lights = get_lights(lights)
    end

    def change!
      size = @lights.last - @lights.first
      cylon_lights = Array.new(size, BLACK)
      cylon_lights[0] = RED

      size.times do
        set_lights(cylon_lights, @lights)
        cylon_lights.rotate!(-1)
        pause
      end

      size.times do
        cylon_lights.rotate!
        set_lights(cylon_lights, @lights)
        pause
      end
    end

    def pause
    end

    def set_lights(values, _lights)
      values.each_with_index do |color, index|
        Lights[_lights[index]] = color
      end
      nil
    end
  end
end

