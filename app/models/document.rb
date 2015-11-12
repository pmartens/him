class Document < ActiveRecord::Base
  has_attached_file :document
  validates_attachment :document, :presence => true,
                                  :content_type => { :content_type => "application/pdf" },
                                  :size => { :in => 0..2.megabytes }
  validates :name, presence: true

end
