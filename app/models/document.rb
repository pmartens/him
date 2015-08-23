class Document < ActiveRecord::Base

  belongs_to :device
  belongs_to :invoice

  has_attached_file :document
  validates_attachment :document, :presence => true,
                                  :content_type => { :content_type => "application/pdf" },
                                  :size => { :in => 0..2.megabytes }

  validates :name, presence: true

  #scope :by_type, ->(type, id) { where('? = ?', type, id) }

end
