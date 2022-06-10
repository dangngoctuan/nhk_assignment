require "rails_helper"

describe Car do
  before do
    @property = { model: 'Mazda 3', wheel: 4, seat: 4, fuel: "gasoline", speed: 100, color: ["black", "red", "white"].sample }
  end

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
      described_class.new.set_value(@property.values)
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
