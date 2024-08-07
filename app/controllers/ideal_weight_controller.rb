class IdealWeightController < ApplicationController
  def index
  end

  def calculate
    age = params[:age].to_i
    if age < 18
      flash.now[:alert] = "You must be 18 or older to use this calculator."
      return render_error_turbo_stream
    end

    calculator = IdealWeightCalculator.new(
      params[:gender],
      age,
      params[:height]
    )

    @ideal_weight = calculator.calculate

    respond_to do |format|
      format.html { redirect_to ideal_weight_path }
      format.turbo_stream
    end
  end

  private

  def render_error_turbo_stream
    respond_to do |format|
      format.html { redirect_to ideal_weight_path }
      format.turbo_stream { render turbo_stream: turbo_stream.replace("flash-messages", partial: "shared/flash_messages") }
    end
  end
end
