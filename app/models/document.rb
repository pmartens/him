class Document < ActiveRecord::Base

  belongs_to :device

  has_attached_file :document
  validates_attachment :document, :presence => true,
                                  :content_type => { :content_type => "application/pdf" },
                                  :size => { :in => 0..2.megabytes }
end