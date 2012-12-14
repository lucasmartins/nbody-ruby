require 'gosu'

class SimulationWindow < Gosu::Window
  def initialize
    super 800.0, 600.0, false
    self.caption = "N-Body Simulation"
  end
  
  def update
  end
  
  def draw
  end
end

window = SimulationWindow.new
window.show