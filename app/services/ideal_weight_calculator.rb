class IdealWeightCalculator
  def initialize(gender, age, height)
    @gender = gender
    @age = age.to_i
    @height = height.to_f
  end

  def calculate
    return nil if @age < 18

    if @gender == 'male'
      ideal_weight = ((@height - 100) - ((@height - 150) / 4)).round(1)
    else
      ideal_weight = ((@height - 100) - ((@height - 150) / 2)).round(1)
    end

    # Adjust for age
    if @age > 50
      ideal_weight -= (@age - 50) * 0.1
    end

    ideal_weight.round(1)
  end
end
