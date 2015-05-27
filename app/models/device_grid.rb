class DeviceGrid

  include Datagrid

  scope do
    Device.order :name => :asc
  end

  filter(:name, :string) {|value| where("name like '%#{value}%'")}
  filter(:device_type_id, :enum, :select => proc { DeviceType.all.map {|t| [t.title, t.id] }} )
  filter(:manufacturer_id, :enum, :select => proc { Manufacturer.all.map {|m| [m.title, m.id] }} )
  filter(:model_name, :enum, :select => Device.select(:model_name).uniq.where.not(model_name: '').map{ |d| [d.model_name, d]})
  filter(:age, :integer ) {|value| where("(datediff(now(), purchased_at) / 365) >= #{value}")}
  filter(:purchased_at, :date, :range => true)
  filter(:created_at, :date, :range => true)
  filter(:room_numbers, :string) {|value| self.joins(network_interface_cards: :network_interfaces).where("network_interfaces.roomnumber like '%#{value}'")}
  filter(:ip_numbers, :string) {|value| self.joins(network_interface_cards: :network_interfaces).where(network_interfaces: {ip: value })}
  filter(:mac_addresses, :string) {|value| self.joins(network_interface_cards: :network_interfaces).where(network_interfaces: {mac: value })}
  filter(:user_id, :enum, :select => proc { User.all.map {|m| [m.full_name, m.id] }} )
  #column_names_filter(:header => "Column", :checkboxes => true)

  column(:name) do |model|
    format(model.name) do
      link_to model.name, model
    end
  end
  column(:device_type, :header => "Type") do
    self.device_type.title unless self.device_type.nil?
  end
  column(:manufacturer, :header => "") do |model|
    format(model.manufacturer) do
      render :partial => "devices/manufacturer", :locals => {:model => model}
    end
  end
  column(:model_name, :header => "Model")
  column(:serialnumber, :html => false) do |model|
    format(model.servicetag) do
      model.servicetag.present? ? link_to(model.serialnumber, model.servicetag) : model.serialnumber
    end
  end
  column(:age)
  column(:purchased_at, :html => false)
  # column(:color) do |model|
  #   format(model.color) do
  #     render :partial => "devices/color", :locals => {:device => model}
  #   end
  # end
  column(:number_of_cpu, :html => false)
  column(:cpu, :html => false) do
    self.cpu.title unless self.cpu.nil?
  end
  column(:number_of_mem, :html => false)
  column(:memory_module, :html => false) do
    self.memory_module.title unless self.memory_module.nil?
  end
  #  column(:network_interfaces) do |model|
  #   format(model.network_interface_cards) do
  #     render :partial => "devices/network_interface_cards", :locals => {:network_interface_cards => model.network_interface_cards}
  #   end
  # end
  # # column(:room_numbers) do |model|
  #   format(model.network_interface_cards) do
  #     render :partial => "devices/room_numbers", :locals => {:network_interface_cards => model.network_interface_cards}
  #   end
  # end
  # column(:ip_numbers) do |model|
  #   format(model.network_interface_cards) do
  #     render :partial => "devices/ip_numbers", :locals => {:network_interface_cards => model.network_interface_cards}
  #   end
  # end
  # column(:mac_addresses) do |model|
  #   format(model.network_interface_cards) do
  #     render :partial => "devices/mac_addresses", :locals => {:network_interface_cards => model.network_interface_cards}
  #   end
  # end

  column(:network_interfaces, :html => false) do
    self.network_interface_cards.map{|i| i.title}.join(', ')
  end

  column(:room_numbers, header: "Room Nrs.") do
    self.room_numbers.join(', ')
  end

  column(:ip_numbers) do
    self.ip_numbers.join(', ')
  end

  column(:mac_addresses) do
    self.mac_addresses.join(', ')
  end

  column(:os) do
    self.operating_systems.join(', ')
  end

  # column(:os) do |model|
  #   format(model.programs) do
  #     render :partial => "devices/os", :locals => {:programs => model.programs}
  #   end
  # end

  column(:consumer) do |model|
    format(model.user) do
      link_to model.user.username, model.user if model.user.present?
    end
  end

  column(:created_at, :html => false) do
    self.created_at.strftime("%Y-%m-%d %H:%M")
  end
  column(:updated_at, :html => false) do
    self.updated_at.strftime("%Y-%m-%d %H:%M")
  end
  column(:nic, :header => "", :html => true) do |model|
    link_to "", device_network_interface_cards_path(model), :class => 'glyphicon glyphicon-hdd'
  end
  column(:documents, :header => "", :html => true) do |model|
    link_to "", device_documents_path(model), :class => 'glyphicon glyphicon-file'
  end
  column(:edit, :header => "", :html => true) do |model|
    link_to "", edit_device_path(model), :class => 'glyphicon glyphicon-edit'
  end
  column(:delete, :header => "", :html => true) do |model|
    link_to "", model, method: :delete, data: { confirm: 'Are you sure?' }, :class => 'glyphicon glyphicon-trash icon-danger'
  end

end
