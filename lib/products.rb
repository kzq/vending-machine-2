class Products
  attr_reader :products

  def initialize(products)
    @products = products
  end

  def load_machine(machine)
    machine.products.concat(@products)
  end
end