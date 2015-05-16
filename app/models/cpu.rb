class Cpu < ActiveRecord::Base

  belongs_to :device

  def title
    "#{self.brand} #{self.processor_number} #{self.frequency} Ghz"
  end
end
