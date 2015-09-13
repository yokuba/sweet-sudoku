class Sudoku
  def initialize(board_string)
    @board = board_string.split("")
  end

  def solve
    until solved?
      # call guess somewhere
      @board.each_with_index do |cell, index|
        if cell == "-"
          cell = possibilities(index)
          @board[index] = cell[0].to_s if cell.length == 1
        end
        system 'clear'; p @board; sleep 0.01
      end
    end
  end

  def solved?
    @board.include?("-") !=true
  end

  def row_values(index)
    value_of_row = index/9
    array_to_check_for_possibilities =[]
    @board.each_with_index do |cell, index|
      if index/ 9 == value_of_row
        array_to_check_for_possibilities << cell
      end
    end
    array_to_check_for_possibilities
  end

  def col_values(index)
    value_of_col = index%9
    array_to_check_for_possibilities =[]
    @board.each_with_index do |cell, index|
      if index% 9 == value_of_col
        array_to_check_for_possibilities << cell
      end
    end
    array_to_check_for_possibilities
  end

  def box_values(index)
    value_of_box = (index/9/3*3) + (index%9/3)
    array_to_check_for_possibilities =[]
    @board.each_with_index do |cell, index|
      if (index/9/3*3) + (index%9/3) == value_of_box
        array_to_check_for_possibilities << cell
      end
    end
    array_to_check_for_possibilities
  end

  def box_index(index)
    (index/9/3*3) + (index%9/3)
    # http://stackoverflow.com/questions/16872773/sudoku-box-indices-start-position?lq=1
  end

  def boxes
  boxes = Array.new(9) {Array.new}
  @board.each_with_index do |cell, index|
    box_index = box_index(index)
    boxes[box_index] << cell
  end
  boxes
end

def possibilities(index)
  possible_values = ['1','2','3','4','5','6','7','8','9']
  possible_values -= row_values(index)
  possible_values -= col_values(index)
  possible_values -= box_values(index)
  possible_values
end

# def guess(array_to_guess_from)
#   used_guesses = []
#   guess_chosen = array_to_guess_from.sample
#   used_guesses << guess_chosen
#   array_to_guess_from -= used_guesses
# end

def to_s
  @board.each_slice(9).map {|row| row.join(" ")}.join("\n")

end

end


s = Sudoku.new('1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--')
t = Sudoku.new('123456780123456780123456780123456780123456780123456780123456780123456780123456780')
# p s.rows
puts
puts "boxes : #{s.box_index(8)}"
puts "rows : #{s.row_values(8)}"
puts "columns : #{s.col_values(8)}"
puts "boxess : #{s.box_values(8)}"
p s.possibilities(62)
# p s.columns
# p s.box_index(62)
# p t.boxes
# p s.solve



