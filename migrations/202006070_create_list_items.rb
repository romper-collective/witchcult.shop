Sequel.migration do
  change do
    create_table :list_items do
      primary_key :id
      String :name
    end
  end
end
