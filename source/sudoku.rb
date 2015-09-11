class Sudoku
  def initialize(board_string)
    @board = board_string.split("")
  end

  def solve
    count = 0
    # while solved? == false || count 81
    while count < 81
      @board.each_with_index do |cell, index|
         if cell == "-"
          [*1..9].each do |possibile_value|

            cell = possibile_value

        #     if rows[index/9].include?(cell)
        end
        puts "#{cell} , #{index}"
        count +=1
      end


    end
  end

  def solved?
    @board.include?("-") !=true
  end

  def rows
    @board.each_slice(9).to_a
  end

  def columns
    rows.transpose
  end

  def boxes
    row_index = (index/9)/9
    column_index = (index/9)%3
  end

  def to_s
    rows.map!{|row| row.join("")}.join('\n')
  end

end




#   attr_accessor :possibile_values
#   def initialize(board_string)
#     @board = board_string.split("")
#     @possible_values = (1..9).to_a
#   end

#   def possibilities(cell,index)
#     cell_row = cell.to_i/9
#     cell_column = cell.to_i%9
#     cell_box = (cell.to_i/3)*3 && (cell.to_i/3)*3
#     possibile_values.select{|index| check_row(index,cell_row) && check_col(index,cell_column) && check_box(index,cell_column)}
#   end

#   def finished?
#     @board.to_a.include?("-") != true
#   end

#   def solve

#   end

#   def board
#   end

#   def check_row(index)  #check row for the values it has & manipulate possibile_values array
#     row_that_number_is_in = index/9

#     indicies_to_check_that_are_in_the_row = (0..80).select{|index| (index/9) == row_that_number_is_in}
#     @board[indicies_to_check_that_are_in_the_row].each do |cell|
#       if possibile_values.include?(cell)
#         possibile_values.delete(cell)
#       end
#     end
#     return possibile_values = [6,9]
#   end

#   def check_col(index) #check column for the values it has & manipulate possibile_values array
#     column_that_number_is_in = index%9
#     indicies_to_check_that_are_in_the_column = (0..80).select{|index| (index%9) == column_that_number_is_in}
#     @board[indicies_to_check_that_are_in_the_column].each do |cell|
#       if possibile_values.include?(cell)
#         possibile_values.delete(cell)
#       end
#     end
#     return possibile_values
#   end

#   def check_box(index)  #check box for the values it has & manipulate possibile_values array
#     column_index = index%9
#     row_index = index/9
#     # box = "#{row_that_number_is_in} , #{column_that_number_is_in}"
#     indicies_to_check_that_are_in_the_box = (0..80).select {|index| (index/9)/9 == row_index  && (index/9)%3 == column_index}  # format is row && column
#     @board[indicies_to_check_that_are_in_the_box].each do |cell|
#       if possibile_values.include?(cell)
#         possibile_values.delete(cell)
#       end
#     end
#     return possibile_values
#   end

#   # Returns a string representing the current state of the board
#   def to_s
#     # @board.map!{|row| row.join("")}.join('\n')
#   end
# end


s = Sudoku.new('1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--')
p s.rows
puts
p s.columns

p s.solve


   # row = (0..80).select{|index| (index/9) == row}
   #  row.each do |index_of_row|
   #    return false if board[index_of_row] == num
   #  end
   #  true
