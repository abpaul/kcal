class CalculatorController < ApplicationController
  def index
  end

  def calculate
    @gender = params[:gender]
    @age = params[:age].to_i
    @weight = params[:weight].to_f
    @height = params[:height].to_f
    @activity_level = params[:activity_level]

    @bmr = calculate_bmr(@gender, @age, @weight, @height)
    @tdee = calculate_tdee(@bmr, @activity_level)
    @weight_loss_calories = (@tdee * 0.85).round

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def calculate_bmr(gender, age, weight, height)
    if gender == 'male'
      88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    else
      447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    end
  end

  def calculate_tdee(bmr, activity_level)
    activity_multipliers = {
      'sedentary' => 1.2,
      'light' => 1.375,
      'moderate' => 1.55,
      'active' => 1.725,
      'very_active' => 1.9
    }
    (bmr * activity_multipliers[activity_level]).round
  end
end
