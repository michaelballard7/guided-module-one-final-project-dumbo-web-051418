class Purchase < ActiveRecord::Base
  belongs_to :car
  belongs_to :buyer

  def self.new_purchase(name, color, brand)
    buyer = Buyer.find_by_name(name).id
    car = Car.car_color?(color, brand)
    self.create(car_id: car, buyer_id: buyer)
    puts "Congratulations! Enjoy your new car!"
  end
end
