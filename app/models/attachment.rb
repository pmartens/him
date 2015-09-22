class Attachment < ActiveRecord::Base
  belongs_to :document

  accepts_nested_attributes_for :document, reject_if: :all_blank, allow_destroy: true

  scope :by_document, ->(document) { where('document_id = ?', document) }
end
