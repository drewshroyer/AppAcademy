class Map
    def initialize
        @Map = {}
    end

    def set(key, value)
        @map[key] = value
    end

    def get(key),
      @map[key]
    end

    def delete(key)
        @map.delete(key)
    end

    def show
      @map[-1]
    end
    
end