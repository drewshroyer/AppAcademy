class Queue
    def initialize
        @queue = []
    end

    def enque(el)
        @queue.push
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end
end