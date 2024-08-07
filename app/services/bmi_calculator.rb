class BmiCalculator
  def initialize(weight, height)
    @weight = weight.to_f
    @height = height.to_f / 100 # convert cm to meters
  end

  def calculate
    bmi = (@weight / (@height * @height)).round(1)
    category = categorize_bmi(bmi)

    {
      bmi: bmi,
      category: category
    }
  end

  private

  def categorize_bmi(bmi)
    case bmi
    when 0..18.4
      "Underweight"
    when 18.5..24.9
      "Normal weight"
    when 25..29.9
      "Overweight"
    else
      "Obese"
    end
  end
end
