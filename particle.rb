
require 'matrix'

class Particle
  #direction => 0..360 degrees.a22859.j
  GRAVITATIONAL_CONSTANT = 6.67384 * (10**-11)  # N(m/kg)**2
  SMALL=2000.0
  MID=2500.0
  BIG=4000.0
  attr_reader :id, :mass, :position,:force

  def initialize(universe,mass,position)
    @id = universe.last_particle_counter+1
    @universe = universe
    @mass = mass
    @position = position
    @force=Vector[0.0,0.0]
    self.print
    @universe.push_counter
  end

  def self.spawn(universe,mass,position)
    if mass==nil
      mass = [SMALL,SMALL,SMALL,MID,MID,BIG].to_a.sample
    end

    if position==nil
      position=Hash.new
      position[:x]=(universe.width/3..universe.width/2).to_a.sample.to_f
      position[:y]=(universe.height/3..universe.height/2).to_a.sample.to_f
    end

    return Particle.new(universe,mass,position)
  end

  def print
    #puts "Particle [#{@id}]: mass=#{mass},position=[#{position[:x]},#{position[:y]}], force=#{@force[0].to_degrees},#{@force[1]}"
  end

  def color
    colors = {1000.0=>:yellow,50000.0=>:red,300000.0=>:purple}
    return colors[@mass]
  end

  def add_force(force_vector)
    @force=@force.delta(force_vector)
  end

  def distance(other_particle)
    distance = Math.hypot(other_particle.position[:x]-self.position[:x],other_particle.position[:y]-self.position[:y])
    return distance
  end

  def calc_force(other_particle)
    force = GRAVITATIONAL_CONSTANT * ((self.mass * other_particle.mass)/self.distance(other_particle))
    #puts "force between p[#{self.id}] and p[#{other_particle.id}] => #{force}"
    return force
  end

  def angle(other_particle)
    angle = Math.atan2(@position[:y] - other_particle.position[:y], other_particle.position[:x] - @position[:x]) * 180 / Math::PI
    return angle
  end

  def interact(other_particle)
    self.add_force(Vector[self.angle(other_particle),self.calc_force(other_particle)])
  end

  def move
    t=1
    y_force = @force[1] * Math.sin(@force[0])
    x_force = @force[1] * Math.cos(@force[0])

    @position[:x]+=x_force/t
    @position[:y]+=y_force/t
  end

end