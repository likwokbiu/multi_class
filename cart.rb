require_relative('product')

class Cart

  def initialize(name)
    @owner_name = name
    @in_cart = []
  end

  def add_product(product, quantity)
    @in_cart << { "product" => product, "quantity" => quantity }
  end

  def remove_product(product)
    @in_cart.delete_if {|a_pick| a_pick["product"] == product}
  end

  def total_cost_notax
    total_cost = 0
    @in_cart.each do |a_pick|
      total_cost += a_pick["product"].base_price * a_pick["quantity"]
    end
    return total_cost
  end

  def total_cost_tax
    total_cost = 0
    @in_cart.each do |a_pick|
      total_cost += a_pick["product"].total_price * a_pick["quantity"]
    end
    return total_cost
  end

end

cart1 = Cart.new('John')

product1 = Product.new('Apple', 1.5, "imp")
product2 = Product.new('Bread', 3.5, "exm")
product3 = Product.new('Beef', 10.5, "std")
product4 = Product.new('Chicken', 5.7, "std")

cart1.add_product(product1, 5)
cart1.add_product(product2, 10)
cart1.add_product(product3, 2)
cart1.add_product(product4, 3)

puts cart1.inspect
puts "Total cost before tax: #{cart1.total_cost_notax}"
puts "Total cost after tax: #{cart1.total_cost_tax}"

cart1.remove_product(product2)

puts cart1.inspect
puts "Total cost before tax: #{cart1.total_cost_notax}"
puts "Total cost after tax: #{cart1.total_cost_tax}"
