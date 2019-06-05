require_relative('../db/sql_runner')
require_relative('adoption')
require_relative('owner')

class Adoption

  attr_reader :id
  attr_accessor :animal_id, :owner_id

  def initialize(options)
     @animal_id = options['animal_id'].to_i
     @owner_id = options['owner_id'].to_i
     @id = options['id'].to_i if options['id']
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    results = SqlRunner.run(sql)
    adoptions = results.map{|adoption| Adoption.new(adoption)}
    return adoptions
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = $1"
    values = [id]
    adoptions = SqlRunner.run(sql, values)
    return Adoption.new(adoptions.first())
  end

  def self.delete(id)
    sql = "DELETE FROM adoptions WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO adoptions
    (
    animal_id, owner_id
    ) VALUES (
    $1, $2)
    RETURNING id"
    values = [@animal_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1;
    "
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    owner = results.map{|owner| Owner.new(owner)}
    return owner.first
  end

  def animal()
    sql = "SELECT * FROM animals
    WHERE id = $1;
    "
    values = [@animal_id]
    results = SqlRunner.run(sql, values)
    animals = results.map{|animal| Animal.new(animal)}
    return animals.first
  end

end
