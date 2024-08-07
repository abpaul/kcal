class BmiController < ApplicationController
  def index
  end

  def calculate
    calculator = BmiCalculator.new(
      params[:weight],
      params[:height]
    )

    results = calculator.calculate

    @bmi = results[:bmi]
    @category = results[:category]

    respond_to do |format|
      format.html { redirect_to bmi_path }
      format.turbo_stream
    end
  end
end
