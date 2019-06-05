require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './controllers/adopter.rb' )
require_relative( './controllers/manager.rb' )

get '/' do
  erb (:login)
end
