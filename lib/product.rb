class Product
  attr_accessor :name, :price

  def initialize(args={})
    @name, @price = args.fetch(:name), args.fetch(:price)
  end

  def buyable?(payment)
    payment >= price
  end
end