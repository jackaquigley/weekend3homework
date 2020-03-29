require ('pry-byebug')

require_relative('models/cinema.rb')
require_relative('models/customers.rb')

movie1 = Films.new ({
  'title' => 'Onward',
  'price' => 8
  })

movie2 = Films.new ({
  'title' => 'The Invisible Man',
  'price' => 10
  })

customer1 = Customer.new ({
  'name' => 'Jack',
  'cash' => 10
  })

customer1.save

binding.pry
nil
