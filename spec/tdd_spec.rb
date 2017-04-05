require 'rspec'
require 'tdd'

describe "my_uniq" do
  it "should filters out duplicates" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end
  it "should return copy with no duplicates" do
    expect([3, 2, 1].my_uniq).to eq([3, 2, 1])
  end
  it "should not mutate self" do
    arr = [1, 2, 3, 3]
    arr.my_uniq
    expect(arr).to eq([1, 2, 3, 3])
  end

end

describe "two_sum" do

  it "should return positions of pairs" do
    expect([-1, 0, 2, -2, 1].two_sum.sort).to eq([[0, 4], [2, 3]])
  end

  it "should be sorted" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "my_transpose" do
  it "should transpose cols to rows" do
    expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
  it "should not mutate original" do
    arr = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    arr.my_transpose
    expect(arr).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
  end
end

describe "stock_picker" do
  let(:stock_array) { [5, 3, 2, 4, 8, 9, 2] }
  it "should return biggest difference" do
    pos = stock_picker(stock_array)
    expect((stock_array[pos[0]] - stock_array[pos[1]]).abs).to eq(7)
    expect((stock_array[pos[1]] - stock_array[pos[0]]).abs).to eq(7)
  end
  it "should return index of the biggest difference" do
    expect(stock_picker(stock_array)).to eq([2, 5])
  end
end
