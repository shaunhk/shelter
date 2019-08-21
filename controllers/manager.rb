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

# This method will allow users to post their images when submitting new animal details
post '/manager/animals' do
  # An @animal object is first assigned to the entered details
  @animal = Animal.new(params)
  # A filename variable is then assigned to the file name of the image uploaded
  @filename = params[:image][:filename]
  # A filepath variable is assigned to the desired filepath where the image will be saved
  @filepath = "/images/#{@filename}"
  # A file variable is assigned to the image file that is temporarily accessible from the upload
  file = params[:image][:tempfile]
  # The file is then read(essentially copied) and then wrote(pasted) into its new folder directory
  File.open("./public#{@filepath}", 'wb') do |f|
    f.write(file.read)
  end
  # The animal image key is then accessed in the ruby animal object and the value is then assigned to the storage filepath
  @animal.image = @filepath
  # The animal object is then called upon by an appropriate method which will log the deails in an sql
  # database
  @animal.save()
  # The erb browser address for this method is assigned.
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
