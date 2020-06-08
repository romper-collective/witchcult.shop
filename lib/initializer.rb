require 'sequel'

DB = Sequel.connect("postgres://#{ENV['POSTGRES_USER']}:#{ENV['POSTGRES_PASSWORD']}@#{ENV['POSTGRES_HOST']}:#{ENV['POSTGRES_PORT']}/#{ENV['POSTGRES_DB']}")
