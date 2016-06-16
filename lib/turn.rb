  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  board = [" "," "," "," "," "," "," "," "," "]

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board, index, current_player = "X")
    board[index] = current_player
  end

  def valid_move?(board, index)
    if position_taken?(board,index)
      return false
    elsif index.between?(0,8)
      return true
    else
      return nil
    end
  end

  def position_taken?(board,position)
    return false if [" ", "", nil].include?(board[position])
    return true if ["X", "O"].include?(board[position])
    raise "#{board[position]} is not a valid move"
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(board, index)
    move(board, index, "X")
    else
    until valid_move?(board, index)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      move(board, index, "X")
      break
    end
  end
  display_board(board)
end
