# frozen_string_literal: true

class AddCidToAccounts < ActiveRecord::Migration[8.1]
  def change
    add_column :accounts, :cid_key_type, :integer, null: true
    add_column :accounts, :cid_public_key, :string, null: true
    add_column :accounts, :cid_private_key, :string, null: true
    add_column :accounts, :cid_uri, :string, null: true
  end
end
