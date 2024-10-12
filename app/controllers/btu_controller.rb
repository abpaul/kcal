class BtuController < ApplicationController
  def index
  end

  def calculate
    calculator = BtuCalculator.new(
      params[:room_area],
      params[:ceiling_height],
      params[:people_count],
      params[:room_type],
      params[:insulation],
      params[:sun_exposure],
      params[:climate]
    )

    @btu = calculator.calculate

    respond_to do |format|
      format.html { redirect_to btu_path }
      format.turbo_stream
    end
  end
end
