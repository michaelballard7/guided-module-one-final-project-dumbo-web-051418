class Car < ActiveRecord::Base
  has_many :purchases
  has_many :cars, through: :purchases

  def self.find_by_name(brand)
    # self.all.select{|car| car.brand == name}
    avalible_car = Car.where(brand:brand)
    puts "We have #{avalible_car.count} avalible #{brand}s."
  end


  def self.book_a_test_drive(brand)
    if Car.exists?(brand: brand)
      puts "We have a #{brand} available for test driving"
    else
      puts "Sorry we do not have a #{brand} in inventory"
    end
  end

  def self.car_color?(color,brand)
    self.where(color: color, brand: brand).ids
  end

end
