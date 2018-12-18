require "sinatra"
require "sinatra/reloader"
require "pry"


def check_guess(guess,num) 
	if (guess).to_i > (num + 5)
		return "Way too high!"
	elsif (guess).to_i < (num - 5)
		return "Way too low!"
	elsif (guess).to_i > num	
		return "Too high!"
	elsif (guess).to_i < num			
		return "Too low!"
	else
		return "You got it right!"
	end	
end

def change_color(message) 

	if message == "Way too high!" || message == "Way too low!"
		return "red"
	elsif message == "Too high!" || message == "Too low!"
		return "#ffcccc"
	elsif message == "You got it right!"
		return "green"	
	end
		
end

num = rand(0..100) 
message = ""
$color = ""

get "/" do
	color = ""

	guess = (params["guess"].to_i)
	message	= check_guess(guess,num)
	$color = change_color(message)
	color = $color

	erb :index, :locals => {:num => num, :message => message, :color => color }

end


