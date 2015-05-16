class MemoryModule < ActiveRecord::Base

  belongs_to :device

  def title
    "#{self.brand} #{self.capacity}GB #{self.speed}Mhz #{self.modeltype} (#{self.modules} Banks)"
  end
end
