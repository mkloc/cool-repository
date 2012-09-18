class Pesel

	attr_reader :array

	def initialize( amount )
		@array = Array.new( amount )
		@amount = amount
	end

	def set_arrays
		index = 0
		while index < @amount
			self.array[index] = gets.to_i
			index += 1
		end
	end

	def to_array
		index = 0
		while index < @amount
			@splited = self.array[index].to_s.split(//)
			sum
			index += 1
		end 
	end

	def sum
		index = 0
		@temp = 0
		while index < 10
			if index%4 == 0
				@temp = @temp + @splited[index].to_i;
			elsif index%4 == 1
				@temp = @temp + 3 * @splited[index].to_i;
			elsif index%4 == 2
				@temp = @temp + 7 * @splited[index].to_i;
			elsif index%4 == 3
				@temp = @temp + 9 * @splited[index].to_i;
			end
			index += 1
		end
		@temp = @temp + @splited[10].to_i
		if_correct
	end

	def if_correct
		if (@temp % 10) == 0
			puts "D"
		else 
			puts "N"
		end
	end

end

doc = Pesel.new(gets.to_i)
doc.set_arrays
doc.to_array

# http://pl.spoj.pl/problems/JPESEL/