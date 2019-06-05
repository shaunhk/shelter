require_relative('../db/sql_runner.rb')
require_relative('owner.rb')

class Animal

  attr_reader :id
  attr_accessor :name, :species, :admission_date, :reserved, :available_for_adoption, :needs_garden, :image, :needs_no_pets, :needs_company, :about_me

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @admission_date = options['admission_date']
    @reserved = options['reserved']
    @available_for_adoption = options['available_for_adoption']
    @needs_garden = options['needs_garden']
    @image = options['image']
    @needs_no_pets = options['needs_no_pets']
    @needs_company = options['needs_company']
    @about_me = options['about_me']
    @id = options['id'].to_i if options['id']
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    animals = SqlRunner.run(sql, values)
    return Animal.new(animals.first())
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    results = SqlRunner.run(sql)
    animals = results.map{|animal| Animal.new(animal)}
    return animals
  end

  def self.delete(id)
    sql = "DELETE FROM animals WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO animals
    (
    name, species, admission_date, reserved, available_for_adoption,
    needs_garden, image, needs_no_pets, needs_company, about_me
    ) VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
    RETURNING id"
    values = [@name, @species, @admission_date, @reserved, @available_for_adoption, @needs_garden, @image, @needs_no_pets, @needs_company, @about_me]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE animals SET
    (name, species, admission_date, reserved, available_for_adoption,
    needs_garden, needs_no_pets, needs_company, about_me)
    = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10"
    values = [@name, @species, @admission_date, @reserved, @available_for_adoption, @needs_garden, @needs_no_pets, @needs_company, @about_me, @id]
    SqlRunner.run(sql, values)
  end

  def owner()
    sql = "SELECT * FROM owners
    INNER JOIN adoptions
    ON adoptions.owner_id = owners.id
    WHERE id = $1;
    "
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    owner = results.map{|owner| Owner.new(owner)}
    return owner.first
  end

end
