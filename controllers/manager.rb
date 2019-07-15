require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/adoption.rb' )
require_relative( '../models/request.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

get '/manager/welcome' do
  applications = Request.all()
  @pending = applications.size()
  erb (:"manager/welcome")
end

get '/manager/owners' do
  @owners = Owner.all()
  erb (:"manager/owner_index")
end

get '/manager/adoptions' do
  @adoptions = Adoption.all()
  erb (:"manager/adoption_index")
end

get '/manager/requests' do
  @applications = Request.all()
  erb (:"manager/request_index")
end

get '/manager/create_adoption' do
  @owners = Owner.all()
  @animals = Animal.all()
  erb (:"manager/create_adoption")
end

get '/manager/animals' do
  @animals = Animal.all()
  erb (:"manager/animal_index")
end

get '/manager/animals/available_only' do
  @animals = Animal.all()
  erb (:"manager/animal_av_ad_index")
end

get '/manager/animals/unavailable_only' do
  @animals = Animal.all()
  erb (:"manager/animal_un_ad_index")
end

get '/manager/:id/animal' do
  @animal = Animal.find(params[:id])
  erb (:"manager/animal")
end

get '/manager/create_animal' do
  erb (:"manager/create_animal")
end

get '/manager/:id/animal/edit' do
  @owners = Owner.all()
  @animal = Animal.find(params[:id])
  erb (:"manager/animal_edit")
end

get '/manager/:id/owner' do
  @owner = Owner.find(params[:id])
  erb (:"manager/owner")
end

get '/manager/create_owner' do
  erb (:"manager/create_owner")
end

get '/manager/:id/owner/edit' do
  @owner = Owner.find(params[:id])
  erb (:"manager/owner_edit")
end

post '/manager/:id/animal/update' do
  @animal = Animal.new(params)
  @animal.update()
  erb (:"manager/animal_update")
end

post '/manager/animals' do
  @animal = Animal.new(params)
  @filename = params[:image][:filename]
  @filepath = "/images/#{@filename}"
  file = params[:image][:tempfile]
  File.open("./public/images/#{@filepath}", 'wb') do |f|
    f.write(file.read)
  end
  @animal.image = @filepath
  @animal.save()
  erb (:"manager/new_animal")
end

post '/manager/:id/animal/delete' do
  Animal.delete(params[:id])
  erb (:"manager/animal_delete")
end

post '/manager/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb (:"manager/new_owner")
end

post '/manager/:id/owner/update' do
  @owner = Owner.new(params)
  @owner.update()
  erb (:"manager/owner_update")
end

post '/manager/:id/owner/delete' do
  Owner.delete(params[:id])
  erb (:"manager/owner_delete")
end

post '/manager/adoptions' do
  @adoption = Adoption.new(params)
  @adoption.save()
  erb(:"manager/adoption_new")
end
