class InvoiceIndex < Chewy::Index

  settings analysis: {
               analyzer: {
                   invoice_number: {
                       tokenizer: 'standard',
                       filter: ['lowercase', 'asciifolding']
                   },
                   invoice_state: {
                       tokenizer: 'standard',
                       filter: ['lowercase', 'asciifolding']
                   },
               }
           }

  define_type Invoice.includes(:user, :supplier, :invoice_type, :documents) do
    field :invoice_number, value: ->{ invoicenumber }
    field :supplier, value: ->(invoice) { invoice.supplier.name }
    field :supplier_id, value: ->(invoice) { invoice.supplier.id }
    field :invoice_date, type: 'date', value: ->{ invoicedate }
    field :invoice_type, value: ->(invoice) { invoice.invoice_type.name unless invoice.invoice_type.nil? }
    field :invoice_state, value: ->{ state }
    field :documents do
      field :name
      field :file_name, value: ->(document) { document.document_file_name }
    end
    field :user, value: ->(invoice) { invoice.user.full_name unless invoice.user.nil? }
    field :user_id, value: ->(invoice) { invoice.user.id unless invoice.user.nil? }
    field :created, type: 'date', include_in_all: false, value: ->{ created_at }
    field :updated, type: 'date', include_in_all: false, value: ->{ updated_at }
  end

end
