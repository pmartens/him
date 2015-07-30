Contacts::ContactsController.class_eval do

  private
  
  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :birthdate, :note, :created_at, :update_at, :supplier, :company_id, :user_id,
    company_attributes:[:id, :name, :_destroy],
    phones_attributes:[:id, :phonetype, :phonenumber, :_destroy],
    emails_attributes:[:id, :emailtype, :email, :_destroy],
    addresses_attributes:[:id, :addresstype, :street, :housenumber, :postalcode, :city, :country, :_destroy],
    homepages_attributes:[:id, :homepagetype, :url, :_destroy])
  end

end
