class InvoiceSearch
  include ActiveData::Model

  attribute :query, String
  attribute :supplier_id, Integer
  attribute :user_id, Integer
  attribute :state, String
  attribute :invoice_start_date, type: Date
  attribute :invoice_end_date, type: Date
  attribute :modify_date, type: Date

  def index
    InvoiceIndex
  end

  def search
    return Invoice.all if attributes.all? { |k,v| v.blank? }
    Invoice.find([query_string, supplier_id_filter, user_id_filter, state_filter, invoice_date_filter].compact.reduce(:merge).collect{ |i| i.id } || {})
  end

  def query_string
    index.query(query_string: {fields: [:invoice_number, :supplier, :user, :invoice_type, :invoice_state ], query: query, default_operator: 'and'}) unless query.blank?
  end

  def supplier_id_filter
    index.filter(term: {supplier_id: supplier_id}) unless supplier_id.blank?
  end

  def user_id_filter
    index.filter(term: {user_id: user_id}) unless user_id.blank?
  end

  def state_filter
    index.filter(term: {invoice_state: state.downcase}) unless state.blank?
  end

  def invoice_date_filter
    index.filter(range: {invoice_date: {gte: invoice_start_date.strftime("%Y-%m-%d"), lte: invoice_end_date.strftime("%Y-%m-%d")}}) unless invoice_start_date.blank? && invoice_end_date.blank?
  end

  def delete_index
    index.delete_all
  end

end