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

end
