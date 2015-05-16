class AddInitialDeviceTypes < ActiveRecord::Migration
  def up
    DeviceType.create(title: "Desktop")
    DeviceType.create(title: "Workstation")
    DeviceType.create(title: "Server")
    DeviceType.create(title: "Laptop")
    DeviceType.create(title: "Monitor")
    DeviceType.create(title: "Printer")
    DeviceType.create(title: "Smartphone")
    DeviceType.create(title: "Tablet")
    DeviceType.create(title: "Storage")
    DeviceType.create(title: "Network")
    DeviceType.create(title: "Projector")
    DeviceType.create(title: "Scanner")
  end

  def down
    DeviceType.delete_all
  end
end
