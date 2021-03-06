class Invoice < ActiveRecord::Base

  after_save :report_finance

  belongs_to :user
  belongs_to :supplier, class_name: 'Contacts::Company', foreign_key: "supplier_id"
  belongs_to :invoice_type
  has_many :attachments, as: :attachmentable
  has_many :documents, through: :attachments

  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :invoice_type, reject_if: :all_blank, allow_destroy: true

  validates :invoicenumber, presence: true, uniqueness: true
  validates :state, presence: true

  update_index 'invoice#invoice', :self

  # STATE	SENT AS	DESCRIPTION
  # Billed: A request for payment has been made, but a payment method has not been selected. Therefore, no payment address or spot rate has been assigned, and the expiration timer has not started.
  # Unpaid:	A request for payment has been made, the payment method has been declared, and the expiration timer is ticking.
  # Paid: Payment has been received in full, but has not been confirmed on the blockchain
  # Ready to Ship: The Payment is confirmed on the blockchain and the merchant. Typically, this is when the merchant releases the goods to the customer.
  # Fulfilled:	An optional state that merchants can use for internal tracking
  # Underpaid:	A payment has been received, but does not fulfill the request for payment at the given exchange rate
  # Merchant Review:	The Expiration window has passed, and the invoice was either underpaid, or a payment was received late
  # Refunded: A Merchant requested that a refund be issued for the invoice
  # Invalid: Any payment on the invoice was flagged as invalid

  STATES  = { billed: 'Billed',
              unpaid: 'Unpaid',
              paid: 'Paid',
              ready_to_ship: 'Ready to Ship',
              fulfilled: 'Fulfilled',
              underpaid: 'Underpaid',
              merchant_review: 'Merchant Review',
              refunded: 'Refunded',
              invalid: 'Invalid'
            }

  def self.states
    STATES
  end

  private

  def report_finance
    if self..state_changed? && [ :paid, :unpaid, :refunded ].include?(self.state.downcase.to_sym)
      InvoiceMailer.report_finance(self).deliver
    end
  end


end