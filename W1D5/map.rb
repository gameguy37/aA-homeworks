class Map

    attr_reader :map

    def initialize
        @map = []
    end

    def set(key, value)
        #Note that the set method can be used to either create a
        #new key-value pair or update the value for a pre-existing key.
        #It's up to you to check whether a key currently exists!
        index = map.index { |pair| pair[0] == key }

        if index.nil?
            map.push([key, value])
        else
            map[index][1] = value
        end
        #I reviewed the solutions and saw that the method
        #returns 'value' here but I'm not sure why.
    end

    def get(key)
        map.each do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
        nil
    end

    def delete(key)
        value = get(key)
        map.reject! { |pair| pair[0] == key }
        value
    end

    def show

    end


end