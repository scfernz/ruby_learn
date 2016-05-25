class Vehicle
  def initialize(year)
    @year = year
    @lights = false
  end

  def year
    @year
  end

  def lights_on?
    @lights
  end

  def lights= new_lights_on
    @lights = new_lights_on
  end
end

class Car < Vehicle

  def initialize year
    super(year)
    @wheels = 4
    @speed = 0
    @model = self.class
  end

  def wheels
    @wheels
  end

  def speed
    @speed
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed -= 10
  end

  def model
    @model
  end
end

class Tesla < Car
  def accelerate
    @speed += 10
  end

  def brake
    @speed -= 7
  end
end

class Tata < Car
  def accelerate
    @speed += 2
  end

  def brake
    @speed -= 1.25
  end
end

class Toyota < Car
  def accelerate
    @speed += 7
  end

  def brake
    @speed -= 5
  end
end

class Garage
  def initialize
    @collection = []
  end

  def collection
    @collection # .map { |e| e.year.to_s + ' '+ e.model.to_s }
  end

  def add_car car
    @collection << car
  end

  def check_class class_type
    count = 0
    @collection.each do |e|
      if e.class.to_s == class_type
      count += 1
      end
    end
    count
  end

  def sort_by_year
    @collection = @collection.sort {|car, car2| car.year <=> car2.year }
  end

  def sort_by_model
    @collection = @collection.sort {|car, car2| car.model.to_s <=> car2.model.to_s }
  end

  def sort_by_model_year
    @collection = @collection.sort { |car, car2| car.model.to_s + car.year <=> car2.model.to_s + car2.year}
  end
end
