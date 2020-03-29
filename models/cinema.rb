require('PG')

class Films

  def initialize(options)
    @title = options['title']
    @price = options['price']
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

end
