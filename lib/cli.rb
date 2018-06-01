class CLI

  @@name = ""
  @@interested_car = []
  @@color = []

  def greet
    puts 'Welcome to the JAM Dealership!'
  end

  def buy_car?
    puts "do you want to buy a car? (yes/no)"
    possible_buyer=gets.chomp
    if possible_buyer == "yes"
      puts "What is your name?"
      name = gets.chomp
      @@name = name
      Buyer.create(name:name)
    else
      puts "Sorry Buyers only in this section"
    end
  end

  def buyer_car_search
    puts "What kind of car do you have in mind?"
    name = gets.chomp
    p Car.find_by_name(name)
    @@interested_car << name
  end

  def test_drive
    car_interest = @@interested_car.first
    puts "Would you like to test drive a #{car_interest}"
    answer = gets.chomp
    unless answer == "no"
      Car.book_a_test_drive(car_interest)
    end
  end

  def color_selection
    puts "Did you enjoy your test drive?"
    answer = gets.chomp
    if answer == "yes"
      puts "Great, what color would you like your car to be?"
      color = gets.chomp
      @@color << color
    if Car.car_color?(color,@@interested_car.first) != nil
      puts "Amazing, we have the perfect car for you!"
    else
      puts "Sorry, we will have to order it from the manufacturer."
    end
    end
  end

  def make_a_purchase
    puts "Sorry for the wait, your loan was approved!"
    Purchase.new_purchase(@@name, @@color.first, @@interested_car.first)
    puts "Here are your keys!"
  end


end
