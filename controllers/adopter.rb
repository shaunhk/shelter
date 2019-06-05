require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/request.rb' )
require_relative( '../models/animal.rb')
also_reload( '../models/*' )

get '/owner/welcome' do
  erb (:"owner/welcome")
end

get '/owner/animals' do
  @animals = Animal.all()
  erb (:"owner/animals")
end

post '/owner/login' do
  @owner = Owner.new(params)
  @owner.save()
  erb (:"owner/login")
end

get '/owner/:id/request' do
  @owners = Owner.all()
  @animal = Animal.find(params[:id])
  erb (:"owner/request")
end

post '/owner/requests' do
  @request = Request.new(params)
  @request.save()
  erb(:"owner/request_new")
end

get '/owner/animals/unreserved' do
  @animals = Animal.all()
  erb (:"owner/unreserved")
end

get '/owner/:id/animal' do
  @animal = Animal.find(params[:id])
  erb (:"owner/animal")
end
