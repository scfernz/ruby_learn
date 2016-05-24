# Object Oriented Ruby Car Challenge

# Purpose: Create class Vehicle which has instance variables year, lights_on, and speed. Methods include:
# check_speed: returns @speed, starts at 0
# accelerate: increments speed by 8
# slow_down: decrements speed by 4
# Signature: Takes parameter (year)
class Vehicle
  # initializes variables for all vehicles
  def initialize(year)
    @year = year
    @lights_on = false
    @speed = 0
  end

  # method to change lights_on
  def lights_on=(new_lights_on)
    @lights_on = new_lights_on
  end

  # returns the value of lights_on
  def lights_on?
    @lights_on
  end

  # returns the value of speed
  def check_speed
    @speed
  end

  # increments speed by 8
  def accelerate
    @speed += 8
  end

  # decrements speed by 4
  def slow_down
    @speed -= 4
  end

  def year
    @year.to_s
  end

  def model
    self.class.to_s
  end

  # getter for Vehicle which returns the year and then class of vehicle
  def check_vehicle_year
    self.year + ' ' + self.model
  end

  # getter for Vehicle returns class and then year of the vehicle
  def check_vehicle_class
    self.model + ' ' + self.year
  end
end

# Create class Car which inherits methods and initialization of vehicle
# Signature: Accepts parameter (year)
class Car < Vehicle
  # Defaults instance variable @wheels to 4
  def wheels
    @wheels = 4
  end

  # Returns value of instance variable @wheels
  def check_wheels_number_car
    @wheels
  end
end

# creates class motorcycle which inherits methods and
# initialization of vehicle
class Motorcycle < Vehicle
  def wheels
    @wheels = 2
  end

  def check_wheels_number_motorcycle
    @wheels
  end

  def accelerate
    @speed += 25
  end

  def slow_down
    @speed -= 10
  end

end

# Create class Tesla which inherits methods and initialization of class Car
class Tesla < Car
  def accelerate
    @speed += 10
  end

  def slow_down
    @speed -= 7
  end
end

# Create class Tata which inherits methods and initialization of class Car
class Tata < Car
  def accelerate
    @speed += 2
  end

  def slow_down
    @speed -= 1.25
  end
end

# Create class Toyota which inherits methods
# and initialization of class Car
class Toyota < Car
  def accelerate
    @speed += 7
  end

  def slow_down
    @speed -= 5
  end
end

class Ducati < Motorcycle
end
# creates object for each class
my_vehicle = Vehicle.new(2016)
my_toyota = Toyota.new(2004)
my_tesla = Tesla.new(2013)
my_tata = Tata.new(2008)

puts my_tata
puts my_tesla
puts my_toyota
puts my_vehicle

# test cases for my_tata
puts my_tata.lights_on?
my_tata.lights_on = true
puts my_tata.lights_on?
puts my_tata.check_speed
my_tata.accelerate
puts my_tata.check_speed
my_tata.slow_down
puts my_tata.check_speed

# test cases for my_toyota
puts my_toyota.check_speed
my_toyota.accelerate
puts my_toyota.check_speed
my_toyota.slow_down
puts my_toyota.check_speed

# test cases for my_tesla
puts my_tesla.check_speed
my_tesla.accelerate
puts my_tesla.check_speed
my_tesla.slow_down
puts my_tesla.check_speed

# Purpose: Creates class Garage which creates an empty array
# stored in instance variable @collection
class Garage
  def initialize
    @collection = []
  end

  # Adds new car objects to collection
  def add_car(car)
    @collection << car
  end

  # Returns the collection of cars by year
  def check_collection_by_year
    @collection.map { |e| e.check_vehicle_year }
  end

  # Returns the collection of cars by model
  def check_collection_by_class
    @collection.map { |e| e.check_vehicle_class }
  end


end



blue_toyota = Toyota.new(2015)
silver_toyota = Toyota.new(1994)
black_tata = Tata.new(1988)
green_tata = Tata.new(2009)
white_tesla = Tesla.new(2013)
red_tesla = Tesla.new(2016)
my_ducati = Ducati.new(2000)
my_ducati.wheels

my_garage = Garage.new
my_garage.add_car(blue_toyota)
my_garage.add_car(silver_toyota)
my_garage.add_car(black_tata)
my_garage.add_car(green_tata)
my_garage.add_car(white_tesla)
my_garage.add_car(red_tesla)
my_garage.add_car(my_ducati)

p my_garage.check_collection_by_year.sort

p my_garage.check_collection_by_class.sort
my_tesla.wheels
puts my_tesla.check_wheels_number_car

p my_ducati.check_wheels_number_motorcycle
p my_ducati.class
p my_ducati.class.superclass
p my_ducati.class.superclass.superclass
p my_tesla.class
p my_tesla.class.superclass
p my_tesla.class.superclass.superclass
