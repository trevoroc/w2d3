class TowersOfHanoi
  attr_reader :piles

  def initialize
    @piles = [[3,2,1], [], []]
  end

  def move(start_pos, end_pos)
    if !@piles[end_pos].empty? && @piles[start_pos].last > @piles[end_pos].last
      raise "Invalid move"
    else
      @piles[end_pos] << @piles[start_pos].pop
    end
  end

  def won?
    @piles[1].length == 3 || @piles[2].length == 3
  end
end
