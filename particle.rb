class Particle
  #direction => 0..360 degrees.a22859.j

  attr_reader :mass, :position,:force

  def initialize(universe,mass,position)
    @universe = universe
    @mass = mass
    @position = position
    puts "New particle: mass=#{mass},position=[#{position[:width]},#{position[:height]}]"
  end

  def self.spawn(universe,mass,position)
    if mass==nil
      mass = (1..3).to_a.sample
    end

    if position==nil
      position=Hash.new
      position[:width]=(0..universe.width).to_a.sample.to_f
      position[:height]=(0..universe.height).to_a.sample.to_f
    end

    return Particle.new(universe,mass,position)
  end

  def color
    colors = [:yellow,:red,:purple]
    return colors[@mass]
  end

  def add_force(force)
    @force+=force
  end

  def self.calculate_force(p1,p2)
    return 0
  end

end