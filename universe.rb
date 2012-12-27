load 'override.rb'
load 'particle.rb'
require 'pry'
require 'pry-nav'

class Universe

  attr_reader :particles,:width,:height,:last_particle_counter

  def push_counter
    @last_particle_counter+=1
  end

  def initialize(particle_number,width,height)
    @last_particle_counter=0
    @particles=[]
    @width=width
    @height=height

    particle_number.times do |n|
      @particles.push Particle.spawn(self,nil,nil)
    end
  end

  def iterate
    #calculate forces
    @particles.each do |source_particle|
      #puts "Iterating all forces for p[#{source_particle.id}]"
      
      @particles.each do |other_particle|
        if source_particle!=other_particle
          source_particle.interact(other_particle)
        end
      end

    end

    #move!
    @particles.each do |p|
      p.print
      p.move
    end
  end


end

