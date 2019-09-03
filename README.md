# Petsmatch
Petsmatch is a prototype web application matching owners and pets looking for adoption. It allows shelter managers to effectively manage their animals and match them with suitable potential pet owners.

## Features
### Managers can:
* View all animals belonging to their shelter
* Filter animals by: available for adoption, unavailable for adoption (such as animals still requiring veterinary treatment) reserved and unreserved animals.
* Manage requests for reserving animals by viewing relevant person and animal details in the requests page
* Add new animals (including pictures)
* Delete and animal or owner from the database
* Edit the status, details and profile of animals
* Manually add potential owners, if they wish to do so
* View past adoptions
* Manually add adoptions on their database

### Owners can:
* View only available animals
* Filter by unreserved status
* Register their details
* View animal details
* Make requests to reserve animals and log their contact details

## Features to be added
* Stylistic changes - make the potential pet owner side more pretty, and the pet manager side more professional
* Allow potential pet owners to view animals from a wide range of shelters, and for managers to upload details about their own shelter. The prototype currently exists as only one specific shelter
* Colour coordinated information based on suitable matches. Managers should be able to more easily see if they have a suitable match
* Allow pet owners to view animals without registering their details
* Allow pet owners to filter by good matches once they have registered their details
* Develop app for mobile browsing

## Installation
You will need to install Ruby, Sinatra and PSQL for this app to work.

On terminal :
```
createdb shelter
cd shelter
ruby db/seed.rb
ruby app.rb
```
