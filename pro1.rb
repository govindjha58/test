require 'sinatra'
require 'data_mapper'

 
set :public_folder, File.dirname(__FILE__) + '/assets'
 

DataMapper.setup(:default, 'sqlite:///'+Dir.pwd+'/project.db')



class User
	
    include DataMapper::Resource
 
    property :id, Serial
    property :email, String
    property :password, String
end


DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions

get '/' do

erb :home 
end



post '/signup' do
    email = params["email"]
    password = params["password"]
 
    user = User.all(email: email).first
 
    if user
        return redirect '/signup'
    else
        user = User.new
        user.email = email
        user.password = password
        user.save
        session[:user_id] = user.id
        return redirect '/'
    end
end

	
