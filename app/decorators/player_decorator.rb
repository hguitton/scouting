class PlayerDecorator < Draper::Decorator
  delegate_all

  def name
    object.lastname.upcase + " " +object.firstname
  end

  def height
    str = object.height_eu.to_s + "cm "
    if(object.height_us)
      str += "(#{object.height_us})"
    end
  end

  def weight
    str = object.weight_eu.to_s + "kg "
    if(object.weight_us)
      str += "(#{object.weight_us} lbs)"
    end
  end
end
