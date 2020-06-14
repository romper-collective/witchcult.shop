class List < Sequel::Model
  many_to_many :list_items
end
