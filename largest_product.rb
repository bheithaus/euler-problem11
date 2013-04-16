
class LargestProduct
	attr_accessor :grid, :greatest_product

	def initialize(number_in_a_row = 4)
		@search_num = number_in_a_row  ##how many in a row are we searching for?
		@greatest_product = 1
	end

	def get_grid(file_name = "p11.txt")
		@grid = []
		File.readlines(file_name).each do |line|
			@grid << line.split(" ").map { |el| el.strip.to_i }
		end
	end

DELTAS = [[1,0],
		 [0,1],
		 [-1,0],
		 [0,-1],
		 [1,1],
		 [1,-1],
		 [-1,-1],
   		 [-1,1]]

	def greatest_product
		@greatest_product
	end

	def test_all 
		length = self.grid[0].length
		length.times do |i|
			length.times do |j|
				test_lines_from_one([i, j], @search_num)
			end
		end
	end

	def test_lines_from_one(pos, n)
		DELTAS.each do |delta|
			next_pos = grow_pos(delta, pos)

			neighbor_values = [self[pos]]
			
			while in_bounds?(next_pos) do
				neighbor_values << self[next_pos]
				puts "neighbor values #{neighbor_values}"

				if neighbor_values.length == n
					puts "testing a neighbor"
					test_neighbors(neighbor_values)
					break
				end

				next_pos = grow_pos(delta, next_pos)
			end
		end
	end

	def test_neighbors(neighbor_values)
		product = 1
		neighbor_values.each { |el| product*=el }
		self.greatest_product = product if product > self.greatest_product
	end

	def [](pos)
		x, y = pos
		@grid[x][y]
	end

	def in_bounds?(pos)
		largest_index = @grid[0].length - 1
		pos.all? { |i| (0..largest_index).include?(i) }
	end

	def grow_pos(delta, pos)
		[delta[0] + pos[0], delta[1] + pos[1]]
	end
end
