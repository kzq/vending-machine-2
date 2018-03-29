require 'forwardable'

class Machine
  extend Forwardable

  def_delegator :@products, :products
  def_delegator :@money, :money

  def initialize(args = {} )
    @products = args[:products]
    @money = args[:money]
  end

  def load(loaders)
    loaders.each { |loader| loader.load_machine(self) }
  end

  def sell(proudct_name,payment)
    product = find_product(proudct_name)
    payment_value = payment.to_value
    if product.buyable?(payment_value)
      load([payment])
      puts "change due = #{payment_value-product.price}"
      product.name
    else
      puts "Insufficent money provided"
    end
  end

  private

  def find_product(proudct_name)
    products.detect { |product| product.name == proudct_name }
  end
end

folder = File.expand_path('.',__dir__)
$:.unshift(folder) unless $:.include?(folder)

require 'products'
require 'product'
require 'products_factory'
require 'money'





