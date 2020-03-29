require('PG')

class Films

attr_reader :id
attr_accessor :title, :price

  def initialize(options)
    @title = options['title']
    @price = options['price'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save()

    db = PG.connect({ dbname: 'cinema', host: 'localhost'})

    sql = "INSERT INTO cinema(
    title,
    price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"

    values = [@title, @price]

    db.prepare("save", sql)

    @id = db.exec_prepared("save", values)[0]["id"].to_i

    db.close

  end

  def Films.delete_all

    db = PG.connect ({ dbname: 'cinema', host: 'localhost'})

    sql = "DELETE FROM cinema"

    db.prepare("delete_all", sql)

    db.exec_prepared("delete_all")

    db.close

  end

  def Films.films_playing()

    db = PG.connect ({ dbname: 'cinema', host: 'localhost'})

    sql = "SELECT * FROM cinema"

    db.prepare("films_list", sql)

    results = db.exec_prepared("films_list")

    db.close

    movie_list = results.map {|movie| Films.new(movie)}

    return movie_list

  end

  def Films.find_by_name(name)

  db = PG.connect ({ dbname: 'cinema', host: 'localhost'})

  sql = "SELECT * FROM cinema WHERE title = $1"

  values = [name]

  db.prepare("find_by_name", sql)

  results = db.exec_prepared("find_by_name", values)

  db.close

  return nil if results.first() == nil

  film_hash = results[0]

  found_film = Films.new(film_hash)

  return found_film

end

def Films.find_by_id(id)

  db = PG.connect ({ dbname: 'cinema', host: 'localhost'})

  sql = "SELECT * FROM cinema WHERE id = $1"

  values = [id]

  db.prepare("find_by_id", sql)

  result = db.exec_prepared("find_by_id", values)

  db.close

  return nil if result.first() == nil

  film_hash = result[0]

  found_film = Films.new(film_hash)

  return found_film

end

end
