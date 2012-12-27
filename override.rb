class Vector
  def delta(force_vector)
    angles=[self[0],
    force_vector[0]
    ].sort.reverse
    #puts "Angles [#{angles[0]},#{angles}]"
    delta=(( (angles[0]-angles[1])%360 + (angles[1]-angles[0])%360 )/2)

    attraction_sum = self[1]+force_vector[1]

    return Vector[delta,attraction_sum]
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