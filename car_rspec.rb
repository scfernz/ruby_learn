require 'rspec'
require_relative 'car'


describe Vehicle do

  it "can be created" do
    expect{Vehicle.new(2016)}.to_not raise_error
  end

  it "always has a model year" do
    my_vehicle = Vehicle.new(2016)
    expect(my_vehicle.year).to be_a Numeric
  end

  it "has lights that start in the off position" do
    my_vehicle = Vehicle.new(2016)
    expect(my_vehicle.lights_on?).to eq false
  end

  it "can have lights that turn on and off" do
    my_vehicle = Vehicle.new(2016)
    my_vehicle.lights = true
    expect(my_vehicle.lights_on?).to eq true
  end
end

describe Car do

  it "can be created" do
    expect{Car.new(2006)}.to_not raise_error
  end

  it "has four wheels" do
    my_car=Car.new(2006)
    expect(my_car.wheels).to eq 4
  end

  it "always has a speed" do
    my_car = Car.new(2006)
    expect{my_car.speed}.to_not raise_error
  end

  it "has an initial speed of zero" do
    my_car = Car.new(2006)
    expect(my_car.speed).to eq 0
  end

  it "can speed up" do
    my_car = Car.new(2006)
    my_car.accelerate
    expect(my_car.speed).to be > 0
  end

  it "can slow down to zero" do
    my_car= Car.new(2006)
    my_car.accelerate
    my_car.brake
    expect(my_car.speed).to eq 0
  end
end

describe Tesla do
  it "can be created" do
    expect{Tesla.new(2015)}.to_not raise_error
  end

  it "can speed up by ten" do
    my_tesla = Tesla.new(2015)
    my_tesla.accelerate
    expect(my_tesla.speed).to eq 10
  end

  it "can slow down by seven" do
    my_tesla = Tesla.new(2015)
    my_tesla.accelerate
    my_tesla.brake
    expect(my_tesla.speed).to eq 10-7
  end
end

describe Tata do
  it "can be created" do
    expect{Tata.new(2004)}.to_not raise_error
  end

  it "can speed up by 2" do
    my_tata = Tata.new(2004)
    my_tata.accelerate
    expect(my_tata.speed).to eq 2
  end

  it "can slow down by 1.25" do
    my_tata = Tata.new(2004)
    my_tata.accelerate
    my_tata.brake
    expect(my_tata.speed).to eq 0.75
  end
end

describe Toyota do
  it "can be created" do
    expect{Toyota.new(2001)}.to_not raise_error
  end

  it "can speed up by seven" do
    my_toyota = Toyota.new(2001)
    my_toyota.accelerate
    expect(my_toyota.speed).to eq 7
  end

  it "can slow down by five" do
    my_toyota = Toyota.new(2001)
    my_toyota.accelerate
    my_toyota.brake
    expect(my_toyota.speed).to eq (7-5)
  end

  it "has lights" do
    my_toyota = Toyota.new(2001)
    expect(my_toyota.lights_on?).to be false
  end

end

describe Garage do
  it "can be created" do
    expect{Garage.new}.to_not raise_error
  end

  it "can hold six cars" do
    my_garage = Garage.new
    my_garage.add_car(tesla_one = Tesla.new(2016))
    my_garage.add_car(tesla_two = Tesla.new(2014))
    my_garage.add_car(tata_one = Tata.new(2006))
    my_garage.add_car(tata_two = Tata.new(2009))
    my_garage.add_car(toyota_one = Toyota.new(2002))
    my_garage.add_car(toyota_two = Toyota.new(2012))
    expect(my_garage.collection.length).to eq 6
  end

  it "has two of each kind of vehicle" do
    my_garage = Garage.new
    my_garage.add_car(tesla_one = Tesla.new(2016))
    my_garage.add_car(tesla_two = Tesla.new(2014))
    my_garage.add_car(tata_one = Tata.new(2006))
    my_garage.add_car(tata_two = Tata.new(2009))
    my_garage.add_car(toyota_one = Toyota.new(2002))
    my_garage.add_car(toyota_two = Toyota.new(2012))

    expect(my_garage.check_class("Tesla")).to eq 2
    expect(my_garage.check_class("Tata")).to eq 2
    expect(my_garage.check_class("Toyota")).to eq 2
  end

  it "can be sorted by year" do
    my_garage = Garage.new
    my_garage.add_car(tesla_one = Tesla.new(2014))
    my_garage.add_car(tesla_two = Tesla.new(2016))
    my_garage.add_car(tata_one = Tata.new(2009))
    my_garage.add_car(tata_two = Tata.new(2006))
    my_garage.add_car(toyota_one = Toyota.new(2012))
    my_garage.add_car(toyota_two = Toyota.new(2002))

    expect(my_garage.collection.sort {|car, car2| car.year <=> car2.year}).to eq my_garage.sort_by_year
  end


  it "can be sorted by model" do
    my_garage = Garage.new
    my_garage.add_car(tesla_one = Tesla.new(2014))
    my_garage.add_car(tesla_two = Tesla.new(2016))
    my_garage.add_car(tata_one = Tata.new(2009))
    my_garage.add_car(tata_two = Tata.new(2006))
    my_garage.add_car(toyota_one = Toyota.new(2012))
    my_garage.add_car(toyota_two = Toyota.new(2002))

    expect(my_garage.collection.sort {|car, car2| car.model.to_s <=> car2.model.to_s}).to eq my_garage.sort_by_model
  end

  it "can be sorted by model then year" do
    my_garage = Garage.new
    my_garage.add_car(tesla_one = Tesla.new(2014))
    my_garage.add_car(tesla_two = Tesla.new(2016))
    my_garage.add_car(tata_one = Tata.new(2009))
    my_garage.add_car(tata_two = Tata.new(2006))
    my_garage.add_car(toyota_one = Toyota.new(2012))
    my_garage.add_car(toyota_two = Toyota.new(2002))

    expect(my_garage.collection.sort {|car, car2| car.model.to_s + car.year <=> car2.model.to_s + car2.year}).to eq my_garage.sort_by_model_year
  end
end
