

class Piece

    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol 
    end

    def move_into_check?(end_pos)
    end

end

class Knight < Piece

end

class King < Piece

end

class Rook < Piece
    include Slideable

end

class Bishop < Piece
    include Slideable

end

class Queen < Piece
    include Slideable

end

class Pawn < Piece 

end

class NullPiece < Piece
    include Singleton

    def initialize
    end

end

module Slideable

end

module Stepable
    
end