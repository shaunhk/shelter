require_relative('../db/sql_runner.rb')
require_relative('animal.rb')

class Owner

  attr_reader :id
  attr_accessor :first_name, :second_name, :has_garden, :has_no_pets, :lives_with_others

  def initialize (options)
    @first_name = options['first_name']
    @second_name = options['second_name']
    @has_garden = options['has_garden']
    @has_no_pets = options['has_no_pets']
    @lives_with_others = options['lives_with_others']
    @id = options['id'].to_i if options['id']
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    owners = results.map{|owner| Owner.new(owner)}
    return owners
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    owners = SqlRunner.run(sql, values)
    return Owner.new(owners.first())
  end

  def self.delete(id)
    sql = "DELETE FROM owners WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO owners
    (
    first_name, second_name, has_garden,
    has_no_pets, lives_with_others
    ) VALUES (
    $1, $2, $3, $4, $5)
    RETURNING id"
    values = [@first_name, @second_name, @has_garden, @has_no_pets, @lives_with_others]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET
    (first_name, second_name, has_garden, has_no_pets, lives_with_others)
    = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@first_name, @second_name, @has_garden, @has_no_pets, @lives_with_others, @id]
    SqlRunner.run(sql, values)
  end

  def animals()
    sql = "SELECT * FROM animals
    INNER JOIN adoptions
    ON adoptions.animal_id = animals.id
    WHERE owner_id = $1;
    "
    values = [@id]
    results = SqlRunner.run(sql, values)
    animals = results.map{|animal| Animal.new(animal)}
    return animals
  end

end
