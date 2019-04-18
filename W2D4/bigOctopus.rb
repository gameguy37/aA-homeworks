require "byebug"

def sluggish
    fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

    largest_fish_length = 0
    largest_fish = nil
    (0...fish.length).each do |i|
        (i...fish.length).each do |j|
            if fish[j].length > fish[i].length && fish[j].length > largest_fish_length
                largest_fish_length = fish[j].length
                largest_fish = fish[j]
            end
        end
    end

    largest_fish
end

# puts sluggish

def clever
    fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

    #debugger
    largest_fish_length = 0
    largest_fish = nil
    (0...fish.length).each do |i|
        if largest_fish.nil? || fish[i].length > largest_fish_length
            largest_fish_length = fish[i].length
            largest_fish = fish[i]
        end
    end
    largest_fish
end

#puts clever

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

class Array

    def dominant
        sorted = self.merge_sort
        sorted[-1]
    end

    def merge_sort(&prc)
        prc ||= Proc.new { |x, y| x.length <=> y.length }

        return self if self.count <= 1

        midpoint = self.count / 2
        sorted_left = self.take(midpoint).merge_sort(&prc)
        sorted_right = self.drop(midpoint).merge_sort(&prc)

        Array.merge(sorted_left, sorted_right, &prc)

    end

    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1
            merged << left.shift
            when 0
            merged << left.shift
            when 1
            merged << right.shift
            end
        end

        merged.concat(left)
        merged.concat(right)

        merged
    end

end

#puts fish.dominant

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
    (0...tiles_array.length).each do |i|
        if direction == tiles_array[i]
            return i
        end
    end
end

# puts slow_dance("up", tiles_array)
# puts slow_dance("right-down", tiles_array)

new_tiles_data_structure = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6, 
    "left-up" => 7
}

def fast_dance(direction, new_tiles_data_structure)
    return new_tiles_data_structure[direction]
end

# puts fast_dance("up", new_tiles_data_structure)
# puts fast_dance("right-down", new_tiles_data_structure)
