class BtuCalculator
  def initialize(room_area, ceiling_height, people_count, room_type, insulation, sun_exposure, climate)
    @room_area = room_area.to_f
    @ceiling_height = ceiling_height.to_f
    @people_count = people_count.to_i
    @room_type = room_type
    @insulation = insulation
    @sun_exposure = sun_exposure
    @climate = climate
  end

  def calculate
    base_btu = @room_area * 10 * @ceiling_height

    base_btu *= room_type_factor
    base_btu *= insulation_factor
    base_btu *= sun_exposure_factor
    base_btu *= climate_factor

    base_btu += @people_count * 600

    base_btu.round
  end

  private

  def room_type_factor
    case @room_type
    when 'bedroom' then 0.9
    when 'living_room' then 1.0
    when 'kitchen' then 1.2
    when 'entire_house' then 1.5
    when 'entire_floor' then 1.3
    else 1.0
    end
  end

  def insulation_factor
    case @insulation
    when 'good' then 0.95
    when 'average' then 1.0
    when 'poor' then 1.1
    else 1.0
    end
  end

  def sun_exposure_factor
    case @sun_exposure
    when 'shaded' then 0.9
    when 'average' then 1.0
    when 'sunny' then 1.1
    else 1.0
    end
  end

  def climate_factor
    case @climate
    when 'cold' then 1.2
    when 'temperate' then 1.0
    when 'hot' then 0.8
    else 1.0
    end
  end
end
