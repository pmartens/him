DatabaseCleaner.clean_with(:truncation)

['Google', 'Apple', 'Microsoft', 'Samsung', 'Xerox', 'HP', 'Citrix'].each do |name|
    Manufacturer.create!(title: name, description: nil, created_at: Time.now, updated_at: Time.now)
end

['PC', 'Laptop', 'Smartphone', 'Tablet', 'Phone', 'Monitor', 'Printer', 'Scanner', 'Handset', 'Server'].each do |name|
  DeviceType.create!(title: name, description: nil, created_at: Time.now, updated_at: Time.now)
end

['administrator', 'previewer', 'user' ].each do |name|
  Role.create!(name: name, created_at: Time.now, updated_at: Time.now)
end

Chewy.strategy(:atomic) do
  User.create!(username: 'admin', firstname: 'admin', email: 'youremail@mail.com', password: 'welcome', created_at: Time.now, updated_at: Time.now )
end

admin = User.find_by(username: 'admin')
admin.roles << Role.find_by(name: 'administrator')
