Sequel.migration do
  change do
    create_table :lists do
      primary_key :id
      String :name
    end

    create_join_table(list_id: :lists, list_item_id: :list_items)
  end
end
