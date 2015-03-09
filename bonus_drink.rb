class BonusDrink
	
	def self.total_count_for(amount)

		amount_s = amount.to_s
		
		if !error?(amount_s)

			amount_int = amount_s.to_i

			a = amount_int
			b = 0
			while a >= 3
				
				b += a.div(3)

				a = a.modulo(3) + a.div(3)

			end

			amount_int += b

			amount_int
		else

			-1
		end
	end

	def self.error?(amount)

		isError = false

		# エラー１：nilである
		isError = (amount == nil)

=begin
			◯エラー２
			整数型に変換できないものを検出
			String.to_iでは、文字列中の整数部分を抜き出して整数化してしまう
			ここでは正規表現チェックにかけて、入力が全て数字でない場合はエラーとする

			「飲み物の本数」は小数・分数をフォローする必要はないと判断

			ex) 以下はエラーとなる
				-1, 1.0, 1/1
=end
		isError = !(/^[0-9]+$/ =~ amount) if !isError

		isError
	end
end

puts BonusDrink.total_count_for(0)
puts BonusDrink.total_count_for(1)
puts BonusDrink.total_count_for(3)
puts BonusDrink.total_count_for(11)
puts BonusDrink.total_count_for(100)