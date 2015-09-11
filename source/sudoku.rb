class Sudoku
  def initialize(board_string)
    @board = board_string
    @possibilities = (1..9).to_a
  end

  def solve
    until solved?
      @board.each_with_index do |char, idx|
        if empty?(char)
          solve_char(idx)
        end
      end
    end
  end

  def empty?(char)
    char == "-"
  end

  def solved?
  end

  def board
  end

  def solve_char(idx)
  end

  def check_box(idx)
  end

  def check_col(idx)

  end

  def check_row(idx)
  end

  # Returns a string representing the current state of the board
  def to_s
  end
end
