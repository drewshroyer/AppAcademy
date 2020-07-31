class Stack
    def initialize
        @stack = []
    end

    def push(el)
      @stack.push
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[-1]
    end
end