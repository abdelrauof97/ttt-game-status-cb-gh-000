def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



#  ruby lib/game_status.rb

board = ["O", " ", " ", " ", "O", "O", "O", " ", "O"]

WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],
[2,5,8], [0,4,8], [2,4,6] ]




def won?(board)

  if WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="X" }} 
    return true
  elsif WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="O" }}
    return true
  end
end


def full?(board)
  if !(board.any? { |x| x == " " } || board.any? { |x| x == "" })
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if draw?(board) ||  full?(board)  ||  won?(board)
    return true
  end
end


def winner?(board)
    if full?(board) || board.all? {|x| x == " "} || board.all? {|x| x == ""}
      return false
    elsif WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="X" }}
      puts "X"
      return WIN_COMBINATIONS.select{ |x|  x.all?{|y| board[y]=="X"}  }
    elsif WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="O" }}
      puts "O"
      return WIN_COMBINATIONS.select{ |x|  x.all?{|y| board[y]=="O"}  }
    else
      return nil
    end
  
end


puts winner?(board)