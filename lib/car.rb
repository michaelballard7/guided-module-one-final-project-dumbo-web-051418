class Car < ActiveRecord::Base
  has_many :purchases
  has_many :cars, through: :purchases

  def self.find_by_name(name)
    # self.all.select{|car| car.brand == name}
    Car.where(brand:name).ids
  end


  def self.book_a_test_drive(brand)
    if Car.exists?(brand: brand)
      puts "We have a #{brand} available for test driving"
    else
      puts "Sorry we do not have a #{brand} in inventory"
    end
  end

end
