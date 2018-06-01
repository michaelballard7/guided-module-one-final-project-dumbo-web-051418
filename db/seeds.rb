require 'faker'

Car.destroy_all

brand = ["chevy", "toyota","lexus","mclaren","tesla","porshce","honda","Range Rover"]
color = ["black", "white","silver","red", "green", "rainbow", "purple", "coral", "blue"]

10.times do |index|
  # Car.create(brand: Faker::Vehicle.manufacturer)
  Car.create(brand: brand.sample, color: color.sample)

end

p "created #{Car.count}"
