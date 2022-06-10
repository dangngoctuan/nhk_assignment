car_properties = [
  { model: 'Mazda 3', wheel: 4, seat: 4, fuel: "gasoline", speed: 100, color: ["black", "red", "white"].sample },
  { model: 'Mitsubishi Xpander', wheel: 4, seat: 4, fuel: "gasoline", speed: 120, color: ["black", "red", "white"].sample },
  { model: 'Mazda cx5', wheel: 4, seat: 5, fuel: "gasoline", speed: 150, color: ["black", "red", "white", "grey"].sample },
  { model: 'Vin fast E34', wheel: 4, seat: 5, fuel: "electricity", speed: 200, color: ["black", "red", "white", "blue", "yellow"].sample }
]

10.times do
  car_properties.each do |property|
    args = Car::FIELDS.map do |field|
      property[field]
    end
    new_car = Car.new.set_value(args)
  end
end
