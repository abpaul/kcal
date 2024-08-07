class CalculatorController < ApplicationController
  def index
  end

  def calculate
    calculator = CalorieCalculator.new(
      params[:gender],
      params[:age],
      params[:weight],
      params[:height],
      params[:activity_level]
    )

    results = calculator.calculate

    @bmr = results[:bmr]
    @tdee = results[:tdee]
    @weight_loss_calories = results[:weight_loss_calories]

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end
end
