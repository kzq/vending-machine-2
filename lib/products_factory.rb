require 'ostruct'

module ProductsFactory
  def self.build(config, products_class = Products)
    products_class.new(
      config.collect { |product_params| create_product(product_params) }
    )
  end

  def self.create_product(param)
    Product.new(name: param[0], price: param[1])
  end
end