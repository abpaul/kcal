class CaloriesCalculator
  def initialize(gender, age, weight, height, activity_level)
    @gender = gender
    @age = age.to_i
    @weight = weight.to_f
    @height = height.to_f
    @activity_level = activity_level
  end

  def calculate
    bmr = calculate_bmr
    tdee = calculate_tdee(bmr)
    weight_loss_calories = (tdee * 0.85).round

    {
      bmr: bmr,
      tdee: tdee,
      weight_loss_calories: weight_loss_calories
    }
  end

  private

  def calculate_bmr
    if @gender == 'male'
      88.362 + (13.397 * @weight) + (4.799 * @height) - (5.677 * @age)
    else
      447.593 + (9.247 * @weight) + (3.098 * @height) - (4.330 * @age)
    end
  end

  def calculate_tdee(bmr)
    activity_multipliers = {
      'sedentary' => 1.2,
      'light' => 1.375,
      'moderate' => 1.55,
      'active' => 1.725,
      'very_active' => 1.9
    }
    (bmr * activity_multipliers[@activity_level]).round
  end
end
