Dir[Rails.root.join("app/models/*.rb")].sort.each { |f| require f }