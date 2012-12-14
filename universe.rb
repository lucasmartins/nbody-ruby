load 'particle.rb'

class Universe

  attr_reader :particles,:width,:height

  def initialize(particle_number,width,height)
    @particles=[]
    @width=width
    @height=height

    particle_number.times do |n|
      @particles.push Particle.spawn(self,nil,nil)
    end
  end

  def iterate
    @particles.each do |source_particle|
      others = @particles.delete(source_particle)
      others.each do |other_particle|
        
      end
    end
  end


end

Universe.new(10,800,600)