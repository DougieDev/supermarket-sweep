class ShoppingCart
  attr_reader :name,
              :capacity,
              :products
  
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def details
    {name: "#{name}", capacity: capacity_to_number}
  end

  def capacity_to_number
    @capacity.delete('items').to_i
  end

  def total_number_of_products
    total_sum = 0
    @products.each do |product|
      total_sum += product.quantity
    end
    total_sum
  end

  def is_full?
    if capacity_to_number > total_number_of_products
      false
    else
      true
    end
  end

  def products_by_category(category)
    @products.find_all {|product| product.category == category}
  end

  def percentage_occupied
    ((total_number_of_products.fdiv capacity_to_number) * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort {|product| product.quantity}
  end

  def product_breakdown
    @products.group_by do |product|
      product.category
    end
  end
end