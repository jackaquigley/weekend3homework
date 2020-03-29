require ('pry-byebug')

require_relative('models/cinema.rb')

movie1 = Films.new ({
  'title' => 'Onward',
  'price' => 8
  })

movie2 = Films.new ({
  'title' => 'The Invisible Man',
  'price' => 10
  })


movie1.save

movie2.save

Films.films_playing

binding.pry
nil
