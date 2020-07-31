require_relative 'piece.rb'
require 'byebug'

class Board

    def initialize
        @board = Array.new(8) {Array.new(8, nil)}
        i = 0
        while i < 8
            @board[0][i] = Piece.new
            @board[1][i] = Piece.new
            @board[6][i] = Piece.new
            @board[7][i] = Piece.new
            i += 1
        end
    end

    def [](pos) 
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        raise ArgumentError.new("there is no piece at start_pos") if start_pos.empty?
        raise ArgumentError.new("invalid move") if  valid_pos?(end_pos) == false
 
        piece = self[start_pos] 
        self[start_pos] = nil
        self[end_pos] = piece
    end

    def valid_pos?(pos)
        if pos[0] > 7 || pos[1] > 7 || pos[0] < 0 || pos[1] < 0 
            return false
        else
            true
        end
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end
    
    def pieces
    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end

end