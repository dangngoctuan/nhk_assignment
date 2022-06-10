class Car
  FIELDS = [:model, :wheel, :seat, :fuel, :speed, :color]

  def call(args)
    FIELDS.each_with_index do |car_field, index|
      self.instance_variable_set("@#{car_field}", args[index])
    end
    self
  end

  def self.set_fields(args)
    args.each do |field|
      attr_accessor "#{field}"
    end
  end

  set_fields FIELDS
end

car_properties = [
  { model: 'Mazda 3', wheel: 4, seat: 4, fuel: "gasoline", speed: 100, color: ["black", "red", "white"].sample },
  { model: 'Mitsubishi Xpander', wheel: 4, seat: 4, fuel: "gasoline", speed: 120, color: ["black", "red", "white"].sample },
  { model: 'Mazda cx5', wheel: 4, seat: 5, fuel: "gasoline", speed: 150, color: ["black", "red", "white", "grey"].sample },
  { model: 'Vin fast E34', wheel: 4, seat: 5, fuel: "electricity", speed: 200, color: ["black", "red", "white", "blue", "yellow"].sample }
]

cars = []

10.times do
  car_properties.each do |property|
    args = Car::FIELDS.map do |field|
      property[field]
    end
    new_car = Car.new.call(args)
    cars << new_car
  end
end

puts cars.count

RSpec.describe Car do
  describe '#Initalize' do
    subject(:car) { described_class.new }
    it 'is a new object' do
      expect(car).to be_kind_of(Car)
      expect(car.respond_to?(:model)).to eq true
      expect(car.respond_to?(:wheel)).to eq true
      expect(car.respond_to?(:seat)).to eq true
      expect(car.respond_to?(:fuel)).to eq true
      expect(car.respond_to?(:speed)).to eq true
      expect(car.respond_to?(:color)).to eq true
    end
  end

  describe '#call' do
    subject(:context) do
      described_class.new.call(car_properties.first.values)
    end
    it 'should be a new object by car_properties' do
      expect(context).to be_kind_of(Car)
      expect(context.model).to eq "Mazda 3"
      expect(context.wheel).to eq 4
      expect(context.seat).to eq 4
      expect(context.fuel).to eq "gasoline"
      expect(context.speed).to eq 100
      expect(["black", "red", "white"]).to include context.color
    end
  end
end
