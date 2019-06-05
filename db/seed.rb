require_relative('../models/adoption.rb')
require_relative('../models/request.rb')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require('pry')
require('pry-byebug')

Request.delete_all()
Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()

owner1 = Owner.new({'first_name' => 'Charlie', 'second_name' => 'Kelly', 'has_garden' => false, 'has_no_pets' => false,
'lives_with_others' => true})
owner1.save()
owner2 = Owner.new({'first_name' => 'Bill', 'second_name' => 'Ponderosa',
'has_garden' => true, 'has_no_pets' => false,
'lives_with_others' => true})
owner2.save()
owner3 = Owner.new({'first_name' => 'Deandra', 'second_name' => 'Reynolds',
'has_garden' => true, 'has_no_pets' => false,
'lives_with_others' => false})
owner3.save()
owner4 = Owner.new({'first_name' => 'Ronald', 'second_name' => 'McDonald',
'has_garden' => true, 'has_no_pets' => true,
'lives_with_others' => true})
owner4.save()

animal1 = Animal.new({'name' => 'God', 'species' => 'Cat',
'admission_date' => '22/12/18', 'needs_garden' => false, 'image' => '/God-cat.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => false})
animal1.save()
animal2 = Animal.new({'name' => 'Patch', 'species' => 'Dog',
'admission_date' => '22/03/19', 'needs_garden' => false, 'image' => '/Patch-Dog.jpg',
'needs_no_pets' => false, 'needs_company' => true, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal2.save()
animal3 = Animal.new({'name' => 'Sea Biscuit', 'species' => 'Horse',
'admission_date' => '22/11/18', 'needs_garden' => true, 'image' => '/seabiscuit-horse.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => false })
animal3.save()
animal4 = Animal.new({'name' => 'Moses', 'species' => 'Cat',
'admission_date' => '31/05/19', 'needs_garden' => false, 'image' => '/moses-cat.jpg',
'needs_no_pets' => true, 'needs_company' => true, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => false})
animal4.save()
animal5 = Animal.new({'name' => 'Bageera', 'species' => 'Cat',
'admission_date' => '03/04/19', 'needs_garden' => false, 'image' => '/bageera-cat.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal5.save()
animal6 = Animal.new({'name' => 'Rover', 'species' => 'Dog',
'admission_date' => '28/08/18', 'needs_garden' => true, 'image' => '/Rover-dog.jpg',
'needs_no_pets' => true, 'needs_company' => true, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal6.save()
animal7 = Animal.new({'name' => 'Thundergun', 'species' => 'Horse',
'admission_date' => '19/08/18', 'needs_garden' => false, 'image' => '/thundergun-horse.jpg',
'needs_no_pets' => false, 'needs_company' => true, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal7.save()
animal8 = Animal.new({'name' => 'Midget', 'species' => 'Hamster',
'admission_date' => '13/04/19', 'needs_garden' => false, 'image' => '/Midget.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => true, 'available_for_adoption' => true})
animal8.save()
animal9 = Animal.new({'name' => 'Peanut', 'species' => 'Hamster',
'admission_date' => '25/04/19', 'needs_garden' => false, 'image' => '/Peanut-hamster.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => true, 'available_for_adoption' => true})
animal9.save()
animal10 = Animal.new({'name' => 'Don', 'species' => 'Budgie',
'admission_date' => '22/02/19', 'needs_garden' => false, 'image' => '/Don.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal10.save()
animal11 = Animal.new({'name' => 'Super', 'species' => 'Parrot',
'admission_date' => '15/05/19', 'needs_garden' => false, 'image' => '/Super.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => true, 'available_for_adoption' => true})
animal11.save()
animal12 = Animal.new({'name' => 'Cuddly', 'species' => 'Snake',
'admission_date' => '21/04/19', 'needs_garden' => false, 'image' => '/cuddly.jpg',
'needs_no_pets' => true, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal12.save()
animal13 = Animal.new({'name' => 'Smartie', 'species' => 'Rabbit',
'admission_date' => '09/04/19', 'needs_garden' => true, 'image' => '/Smartie.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => false})
animal13.save()
animal14 = Animal.new({'name' => 'Tofu', 'species' => 'Rabbit',
'admission_date' => '02/01/19', 'needs_garden' => true, 'image' => '/tofu.jpg',
'needs_no_pets' => false, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => false})
animal14.save()
animal15 = Animal.new({'name' => 'Elvis', 'species' => 'Cat',
'admission_date' => '31/05/19', 'needs_garden' => false, 'image' => '/Elvis.jpg',
'needs_no_pets' => true, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => false})
animal15.save()
animal16 = Animal.new({'name' => 'Rocky', 'species' => 'Parrot',
'admission_date' => '16/09/18', 'needs_garden' => true, 'image' => '/Rocky.jpg',
'needs_no_pets' => true, 'needs_company' => false, 'about_me' => '', 'reserved' => false, 'available_for_adoption' => true})
animal16.save()

adoption1 = Adoption.new('animal_id' => animal1.id, 'owner_id' => owner1.id)
adoption1.save()
adoption2 = Adoption.new('animal_id' => animal2.id, 'owner_id' => owner1.id)
adoption2.save()
adoption3 = Adoption.new('animal_id' => animal3.id, 'owner_id' => owner2.id)
adoption3.save()
adoption4 = Adoption.new('animal_id' => animal8.id, 'owner_id' => owner3.id)
adoption4.save()
adoption5 = Adoption.new('animal_id' => animal11.id, 'owner_id' => owner3.id)
adoption5.save()
adoption6 = Adoption.new('animal_id' => animal14.id, 'owner_id' => owner3.id)
adoption6.save()

request1 = Request.new({'animal_id' => animal2.id, 'owner_id' => owner1.id, 'phone_number' => 42071241815892, 'email_address' => 'Rats4giveme@msn.com', 'decided' => false})
request1.save()

binding.pry
nil
