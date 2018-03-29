require 'pry'
require './lib/machine'

puts "\n\nR5: The machine should take an initial load of products and change............\n\n"

products = ProductsFactory.build([['pepsi', 0.5],['chocolate', 0.70]])

money = Money.new(['1p','50p'])

#products = Products.new(products)

vending_machine = Machine.new(products: products, money: money)

puts "vending_machine = #{vending_machine.inspect}"

puts "\n\n\R5 = There should be a way of reloading either products or change at a later point\n\n"

new_products = ProductsFactory.build([['coca-cola', 0.6],['gum', 0.1]])

vending_machine.load([new_products,money])

puts "vending_machine = #{vending_machine.inspect}"

puts "\n\nR1 = Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.\n\n"


product = vending_machine.sell("pepsi", Money.new(['£1']))

puts "product = #{product}"

puts "\n\nR2 = It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.\n\n"

vending_machine.sell("pepsi", Money.new(['20p']))