require 'sinatra'

get '/' do
	return "HELLO World"
end

	get '/profile' do
		return This is a profile page
end

get '/profile/:user' do 
	return user 
end

get '/print/:str/:times' do
	result = ' '
	params["times"].to_i.times do
		result = result + params["str"]+'<br>'
end
return result
end