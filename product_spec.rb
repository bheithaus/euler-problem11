require 'rspec'
require './largest_product'

describe LargestProduct do

	describe "test_diagonals" do
		it "tests a diagonal line from a a starting position" do
			largest = LargestProduct.new
			largest.grid  = [[6,1,1,1],
							 [1,6,1,1],
							 [1,1,6,1],
							 [1,1,1,6]]
			start_pos = [0,0]
			largest.test_diagonals(start_pos, 4)
			largest.greatest_product.should == 1296
		end
	end

	it "gets a grid from file" do
		largest = LargestProduct.new
		largest.get_grid("p11test.txt")
		largest.grid.should == [[8,10,38,40],
								[34,33,31,34],
								[3,32,22,13],
								[41,24,72,13]]

	end

	it "tests all the diagonals" do
		largest = LargestProduct.new
		largest.grid  = [[6,1,1,8],
						 [1,6,8,1],
						 [1,8,6,1],
						 [8,1,1,6]]
		start_pos = [0,0]
		largest.test_all
		largest.greatest_product.should == 4096
	end
end