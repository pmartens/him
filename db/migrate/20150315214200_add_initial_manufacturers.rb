class AddInitialManufacturers < ActiveRecord::Migration
  def up
    Manufacturer.create(title: "Microsoft")
    Manufacturer.create(title: "Dell")
    Manufacturer.create(title: "Google")
    Manufacturer.create(title: "Ubuntu")
    Manufacturer.create(title: "Apple")
    Manufacturer.create(title: "Citrix")
    Manufacturer.create(title: "VMware")
  end

  def down
    Manufacturer.delete_all
  end
end
