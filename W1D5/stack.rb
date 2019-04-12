class Stack

    attr_reader :stack

    def initialize
        @stack = []
    end

    def push(el)
        stack.push(el)
        #I chose to omit the code that would return
        #the underlying array and items contained therein,
        #including the pushed item.
        #interestingly, the homework solution returns the
        #ele that was pushed in rather than the array.
        #is this correct?
    end

    def pop
        stack.pop
    end

    def peek
        stack.last
    end

end