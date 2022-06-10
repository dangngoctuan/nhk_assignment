class Car
  FIELDS = [:model, :wheel, :seat, :fuel, :speed, :color]

  def set_value(args)
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
