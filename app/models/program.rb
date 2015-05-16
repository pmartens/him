class Program < ActiveRecord::Base

  has_and_belongs_to_many :devices

  scope :operating_systems, -> {where(os: true)}
  scope :no_operating_systems, -> {where(os: false)}

  def full_title
    "#{self.title} #{self.version}"
  end

end
