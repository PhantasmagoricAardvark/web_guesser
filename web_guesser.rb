require "sinatra"
require "sinatra/reloader"
require "pry"


def check_guess(guess,num) 

	if guess == num
		return "You got it right!"
	elsif Guesses.show == 5
		return "You lost! A new number has been generated"
	elsif (guess).to_i > (num + 5)
		return "Way too high!"
	elsif (guess).to_i < (num - 5)
		return "Way too low!"
	elsif (guess).to_i > num	
		return "Too high!"
	elsif (guess).to_i < num			
		return "Too low!"
	end	
end

class Message
	@@message = ""

	def self.change_color(message) 
		@@message = message
		if message == "Way too high!" || message == "Way too low!"
			return "red"
		elsif message == "Too high!" || message == "Too low!"
			return "#ffcccc"
		elsif message == "You got it right!"
			Num.change
			Guesses.set_5
			return "green"	
		else 
			"red"
		end
	end

	def self.show 
		@@message
	end
		
end

class Guesses 
	@@guesses = 5

	def self.reduce 
		@@guesses -= 1
		if @@guesses <= 0
			Num.change
			@@guesses = 5
		end 
	end


	def self.set_5
		@@guesses = 5
	end

	def self.show
		@@guesses
	end
end

class Num
	@@num = rand(0..100)

	def self.show
		@@num
	end

	def self.change
		@@num = rand(0..100)
	end

end	


message = ""
$color = ""


get "/" do
	color = ""
	num = Num.show
	Guesses.reduce

	remaining = Guesses.show



	guess = (params["guess"].to_i)
	message	= check_guess(guess,num)
	$color = Message.change_color(message)
	color = $color

	cheat = (params["cheat"])



	erb :index, :locals => {:num => num, :message => message, :color => color, :remaining => remaining, :cheat => cheat }

end


