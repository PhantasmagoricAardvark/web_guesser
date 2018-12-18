require "sinatra"
require "sinatra/reloader"


message = ""

def check_guess(guess,num) 

	if (guess).to_i > (num + 5)
		message = "Way too high!"
	elsif (guess).to_i < (num - 5)
		message = "Way too low!"
	elsif (guess).to_i > num	
		message = "Too high!"
	elsif (guess).to_i < num	
		message = "Too low!"
	else
		message = "You got it right!"
	end	
end

num = rand(0..100) 


get "/" do

	guess = (params["guess"].to_i)
	message	= check_guess(guess,num)


	erb :index, :locals => {:num => num, :message => message }

end

