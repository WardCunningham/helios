module Helios
  class CylonEffect < Effect
    RED = [255,0,0]
    BLACK = [0,0,0]

    def initialize(args = {})
      lights = args.fetch('lights', [5, '..', 8])
      @lights = get_lights(lights)
    end

    # def change!
    #   size = 2
    #   # size = @lights.last - @lights.first
    #   cylon_lights = Array.new(size, BLACK)
    #   cylon_lights[0] = RED

    #   size.times do
    #     set_lights(cylon_lights)
    #     cylon_lights.rotate!(-1)
    #     pause
    #   end

    #   size.times do
    #     cylon_lights.rotate!
    #     set_lights(cylon_lights)
    #     pause
    #   end
    # end

    def pause
    end

    def set_lights(values)
      threads = []
      lights.each_with_index do |color, index|
        Lights[@lights[index]] = color
      end
      nil
    end
  end
end

