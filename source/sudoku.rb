class Sudoku
  def initialize(board_string)
    @board = board_string.chars
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
    !@board.include?("-")
  end

  def set_num(guess, idx)
      @board[idx] = guess
  end

  # def board
  # end

  def valid?(group)
        group == group.uniq
    # require 'pry-byebug'; binding pry-byebug

  end

  def solve_char(idx)
    possible = ("1".."9").to_a
    not_possible = [create_box(idx), create_col(idx), create_row(idx)].flatten
    not_possible -= ["-"]
    possible -= not_possible
    counter = 0

    @board[idx] = possible.sample
    not_possible << @board[idx]
  end


  def create_box(position)
    blockIndex = calculate_box_index(position)

    box_members = []

    while (box_members.length < 9)
      box_row = @board[blockIndex, 3]
      box_members.concat(box_row)
      blockIndex += 9
    end

    box_members

  end

  def calculate_box_index(position)
    row = position / 9
    col = position % 9

    blockRow = (row / 3) * 3
    blockCol = (col / 3) * 3

    (blockRow * 9) + blockCol
  end

  def create_col(position)
    col_idx = position % 9
    col_members = []

    cols = []

    @board.each_slice(9) do |slice|
      cols << slice
    end

    cols = cols.transpose

    cols.each_with_index do |char, index|
      if (index % 9) == col_idx
        col_members << char
      end
    end

    col_members
  end

  def create_row(position)
    row_idx = position / 9

    row_members = []

    @board.each_with_index do |char, index|
      if (index / 9) == row_idx
        row_members << char
      end
    end

    row_members
  end

  # Returns a string representing the current state of the board
  def to_s
    output = ''
    @board.each_slice(9) do |slice|
      output << slice.join('   ') + "\n\n"
    end
    output
  end
end
