class Vector
  def delta(force_vector)
    angles=[self[0],force_vector[0]].sort.reverse
    delta=(angles[0].degrees-angles[1].degrees)*1.5

    

    return Vector[delta,]
  end
end

class Numeric
  def degrees
    self * Math::PI / 180
  end
  def to_degrees
    self/Math::PI*180
  end
end