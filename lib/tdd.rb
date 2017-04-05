require 'byebug'

class Array

  def my_uniq
    newarr = []
    self.each { |el| newarr << el unless newarr.include? el }
    newarr
  end

  def two_sum
    answer, temporary = [], []

    self.each_with_index do |el, i|
      temporary.each_with_index do |el2, j|
        answer.unshift([j, i]) if el == -el2
      end
      temporary << el
    end

    answer
  end

  def my_transpose
    transposed = []
    (0...length).each do |row|
      newrow = []
      (0...length).each do |col|
        newrow << self[col][row]
      end
      transposed << newrow
    end
    transposed
  end
end

def stock_picker(stock_array)
  max = 0
  answer = []

  stock_array.each_with_index do |buy_price, buy_day|
    stock_array.drop(buy_day + 1).each_with_index do |sell_price, sell_day|
      diff = sell_price - buy_price
      if diff > max
        answer = [buy_day, sell_day + buy_day + 1]
        max = diff
      end
    end
  end
  answer
end
