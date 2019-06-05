require_relative('../db/sql_runner')
require_relative('adoption')
require_relative('owner')
require_relative('animal')

class Request

  attr_reader :id
  attr_accessor :animal_id, :owner_id, :phone_number, :email_address, :decided

  def initialize(options)
     @animal_id = options['animal_id'].to_i
     @owner_id = options['owner_id'].to_i
     @email_address = options['email_address']
     @phone_number = options['phone_number']
     @decided = options['decided']
     @id = options['id'].to_i if options['id']
  end

  def self.delete_all()
    sql = "DELETE FROM requests;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM requests;"
    results = SqlRunner.run(sql)
    requests = results.map{|request| Request.new(request)}
    return requests
  end

  def self.find(id)
    sql = "SELECT * FROM requests WHERE id = $1"
    values = [id]
    requests = SqlRunner.run(sql, values)
    return Request.new(requests.first())
  end

  def self.delete(id)
    sql = "DELETE FROM requests WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO requests
    (
    animal_id, owner_id, decided, phone_number, email_address
    ) VALUES (
    $1, $2, $3, $4, $5)
    RETURNING id"
    values = [@animal_id, @owner_id, @decided, @phone_number, @email_address]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE requests SET
    (animal_id, owner_id, decided, phone_number, email_address)
    = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@animal_id, @owner_id, @decided, @phone_number, @email_address, @id]
    SqlRunner.run(sql, values)
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
