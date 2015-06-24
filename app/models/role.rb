class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  scope :is_admin, -> { where(id: 1) }

end
