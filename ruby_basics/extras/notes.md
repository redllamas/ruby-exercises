## Variable types

```ruby
MY_CONSTANT = "This is a constant, accessible anywhere"
$global_variable = "This is also accessible anywhere"
@@class_variable = "This is accessible within a class and its methods"
@instance_variable = "This is only accessible within an instance of a method"
local_variable = "This is only available within a block, and obeys all scrope boundaries"
```

## Scopes and blocks

Local variables defined inside a block will not be available outside that block. What defines a block?

Anything between a ```ruby do...end``` statement like this?
```ruby
a = 3

3.times do |n|
  a = 5
  b = 10
end

puts a
puts b
```

```a``` will get 5 and ```b``` will raise an "undefined local variable or method" exception.

## Blocks and procs

Consider also the following:

```ruby
# passing_block.rb

def take_block(&block)
  block.call
end

take_block do
  puts "Block being called in the method!"
end
```
```&``` marks that ```block``` is a proc, and what is available inside the proc is available inside the ```take_block``` method.


## About puts and p

```puts``` always returns nil
```p``` returns the object you pass to it

This can be trouble if used inside a method.

e.g.

```ruby
def methods
  puts 123
end
```

This will return ```nil``` instead of the expected ```123```.

## Conditionals

```#eql?``` method checks both the value type and the actual type it holds.

```ruby
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true
```

Whereas ```#equal?``` checks whether both values are the same in memory.

```<=>``` is the "spaceship operator," which returns the following:

* ```-1``` if the value on the left is less than the value on the right
* ```0``` if values on the left and right are equal
* ```1``` if the value on the right is greater than the value on the left

e.g. 
```ruby
5 <=> 10    #=> -1
10 <=> 10   #=> 0
10 <=> 5    #=> 1
```

This is most commonly used in **sorting functions**. Sounds like the kind of thing that I wouldn't use often but would be good to know.

```unless``` statements process the code in the following section/block if the expression evaluates to ```false```.
e.g.
```ruby
a = 2
puts "yes" unless a = 1

=>2
```

```?``` or the "ternary" operator is something I'm familiar with from other languages, but for the sake of revision, it follows the format:
```ruby
age = 19
response = age < 18 ? "young" : "sorry, old"
puts response #=> "sorry, old"
```

It's like a one line ```if...else``` statement.

Ruby also has a ```.between?(a, b)``` method to see if a value is between a and b.

## Loops

* ```loop``` loop: goes until you give it a ```break if (conditional)```
* ```while``` loop: while i < 20 {...}
* ```until``` loop: keep going until it matches a conditional, opposite of a while loop
* ```(1..5)```: internal range
* ```(1...5)```: external range
* ```for``` loop: useful for iterating through collections of info like array or ranges
* ```.times``` loop: iterates a specific number of times
* ```5.upto(10)``` loop for specific numbers
* ```10.downto(5)``` loop for the other direction

## Arrays

Can check methods with Array.methods in instance_variable

* ```push``` or ```<<```/"shovel" operator adds elements to the end of an array and returns an array with the new elements.
* ```pop``` will remove the element at the end of an array and return that element
* ```shift``` and ```unshift``` add and remove elements at the beginning of an array
* ```pop``` and ```shift``` can accept int args and return that many elements
* ```+``` operator on two arrays will concatenate them, and ```a.concat(b)``` will do the same
* ```-``` will return the difference between two arrays
* ```#clear``` wipes the array of all elements
* ```#insert(2, :foo)``` inserts ```:foo``` at index 2 of the array
* ```#uniq``` returns all unique elements
* ```#uniq!``` removes duplicates, or non-unique elements from the array
* ```#sample``` returns a random element from the array

## Hashes

Initialize with:

```my_hash = Hash.new``` or ```my_hash = {}```

A hash is a list of key-value pairs, and is constructed with notation like ```my_hash = {"key" => "value", "key2" => "value2"}``` or ```my_hash = {key: "value1", key2: "value2"}```.

Call on the items with ```my_hash["key2"]``` or ```my_hash[:key2]```.

The second pattern is better in Ruby, as it uses symbols for cleaner syntax.
e.g.
```ruby
# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}
```

will return

```ruby
american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"
```
## methods

* Implicit return: Ruby returns by default the insides of a method declaration
* ```return``` vs ```puts```: ```return``` will send back the value of the expression following it, `puts` just prints to terminal and returns `nil`.
* Chaining methods: ```[1,2,3].reverse.sort```
* Predicate methods: ```.even?``` return `true` or `false`
* Bang methods: ```.upcase!```
* Method names can't start with a number, can't contain characters `_`, `?`, `!`, `=`, and apart from `_`, can only appear at the end of the names
* Method names should be descriptive, duh
* Methods should have one function.
* They can, but don't have to take params as arguments: `method(arg)`, and later we'll see in Rails: `@thing = Thing.find(paramams[:id])`
* Don't define methods with `puts` unless you just want to print something to standard output. e.g. `puts_squared(2)` will put `4`, but `x = puts_squared(2)` will not assign `x` the value of `4`.


## Debugging

Use `p` instead of `puts` to inspect things mid method if something is going wrong.

Can also try using the `pry-byebug` gem for debugging.

`binding.pry` inserts a breakpoint for the pry tool in your code, but it won't know anything about the code following it, because it hasn't been evaluated yet.

## Enumerables

* `#each`, `#each_with_index`
* `#map` (== `#collect`)
* `#select` and `#reject`, e.g. `.select {|item| item != "Yucky thing"}` is equivalent to `.reject {|item| item == "Yucky thing"}` 
* `#reduce`
* `#select` == `#filter`
* Differences between `do..end` and `{...}`
* Notes on bang methods and why it is or isn't considered best practice.

`#each` just iterates over every item in a collection, whereas `#each_with_index` brings the index too to provide extra functionality.
e.g.

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
```

Here we check if the index of the item is even, so it `puts` `fruit[0]` and `fruit[2]` which are "apple" and "strawberry".

`#each`, `#each_with_index` both return the full collection as the return value.

`#map` takes an enumerated item, does something to it for the purpose of pushing it to a collection or back to itself.
e.g.

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

or 

```ruby
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
```

`#reduce` can be tricky to grasp, and I seem to remember it from studying Haskell.
It applies a method (i.e. `#+`, `#*`) to all items in a list, reducing the list to a single key, value pair.
i.e. for an array of numbers, reducing with a temporary sum variable looks like this.
```ruby
numbers = [1,2,3,4]
numbers.reduce {|sum, number| sum += number}
#=> 10
```

You also reduce a "votes" array for example and return its unique members and their vote count in a hash.

```ruby
votes = ["Bob", "Bob", "Terry", "John", "Bob"]
votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob"=>3, "Terry"=>1, "John"=>1}
```

The `#map` example earlier can also be called as a bang method (`#map!`) to modify the items in the collection, not just temporary apply the transformation to them.

Just my guess, but a lot of the methods in Rails used in `show` actions are enumerables, especially when it comes to scoped variables.
i.e. `Post.find(where(:published_date == nil))` etc.

Difference between `#select` and `#collect` is that collect returns the results of the block, not the original collection.

#each returns the original object it was called on because it’s really used for its side effects and not what it returns
#each_with_index passes not just the current item but whatever position in the array it was located in.
#select returns a new object (e.g. array) filled with only those original items where the block you gave it returned true
#map returns a new array filled with whatever gets returned by the block each time it runs.
#any? returns true/false (see the question mark?) and answers the question, "do ANY of the elements in this object pass the test in my block?". If your block returns true on any time it runs, any? will return true.
#all? returns true/false and answers the question, "do ALL the elements of this object pass the test in my block?". Every time the block runs it must return true for this method to return true.
#none? returns true only if NONE of the elements in the object return true when the block is run.
#find returns the first item in your object for which the block returns true.
Can also do `#map.with_index` and `#group_by`

## Nested collections

Can't create a nested array with two arrays in the params, because the Array class expects the second param to be the default value, not a second array initial size.

To iterate over the internal values of a nested collection/array, you would need to nest another enumerable method.
e.g.

```ruby
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
```

If you _only_ need the internal values, flatten the arrays first before calling it.

```ruby
teacher_mailboxes.flatten.each do |t|
  puts "#{t} is amazing!"
end
```
To query the data inside, you have to be careful about calling predicate methods like `#any?` and `#all?`.
e.g.

```Ruby
test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

# the following will be returned as false
test_scores.any? do |scores|
  scores.all? {|score| score > 80}
end

# this will be returned as true
test_scores.all? do |score|
  scores.any? {|score| score > 80}
end
```

The first example tests if ANY array of scores have ALL 80s, which is false, whereas the second evaluates ALL of the arrays on the condition that ANY of them has a score greater than 80.

Can also use the `#dig` method to dig into the key name as passed by params.

Nested hashes are a level up on nested arrays, but are common. JSON is like a multi-dimensional hash, kinda?

Here is an example of a method than finds owners of cars from 2020 onwards.
```ruby
vehicles = {
  :alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, 
  :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, 
  :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}
}

vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]
```
