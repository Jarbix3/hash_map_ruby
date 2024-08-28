require_relative 'lib/hash_map'

test = HashMap.new

test.set('name', 'John')
test.set('eyes', 'blue')

p test.get('name') # should return 'John'
p test.get('eyes') # should return 'blue'
p test.get('age') # should return nil

p test.has?('name') # should return true
p test.has?('age') # should return false
p test.length

p test.remove('eyes')
p test.get('eyes') # should return nil

p test.keys
p test.values
p test.entries