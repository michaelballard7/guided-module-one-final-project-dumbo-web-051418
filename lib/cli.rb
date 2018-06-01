class CLI

  @@name = ""
  @@interested_car = []
  @@color = []

  def greet
    banner = <<-eof

                       888888        d8888 888b     d888
                         "88b       d88888 8888b   d8888
                          888      d88P888 88888b.d88888
                          888     d88P 888 888Y88888P888
                          888    d88P  888 888 Y888P 888
                          888   d88P   888 888  Y8P  888
                          88P  d8888888888 888   "   888
                          888 d88P     888 888       888
                        .d88P
                      .d88P"
                     888P"
8888888b.                    888                           888      d8b
888  "Y88b                   888                           888      Y8P
888    888                   888                           888
888    888  .d88b.   8888b.  888  .d88b.  888d888 .d8888b  88888b.  888 88888b.
888    888 d8P  Y8b     "88b 888 d8P  Y8b 888P"   88K      888 "88b 888 888 "88b
888    888 88888888 .d888888 888 88888888 888     "Y8888b. 888  888 888 888  888
888  .d88P Y8b.     888  888 888 Y8b.     888          X88 888  888 888 888 d88P
8888888P"   "Y8888  "Y888888 888  "Y8888  888      88888P' 888  888 888 88888P"
                                                                        888
                                                                        888
                                                                        888
eof
puts banner
    puts 'Welcome to the JAM Dealership!'
  end

  def buy_car?
    puts "Do you want to buy a car? (yes/no)"
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
    puts "Are you ready to become a new car owner?"
    answer = gets.chomp
    if answer == "yes"
      puts "Sorry for the wait, your loan was approved!"
      Purchase.new_purchase(@@name, @@color.first, @@interested_car.first)
      puts "Here are your keys!"
    else
      puts "GET OUT!!!!"
    end
  end


end
