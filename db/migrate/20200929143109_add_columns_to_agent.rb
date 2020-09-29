class AddColumnsToAgent < ActiveRecord::Migration[6.0]
  def change
    add_column :agents, :fullname, :string
    add_column :agents, :username, :string
    add_column :agents, :about, :text
    add_column :agents, :from, :string
    add_column :agents, :language, :string
    add_column :agents, :status, :boolean, default: false
    add_column :agents, :admin, :boolean, default: false
    add_column :agents, :slug, :string
    add_column :agents, :active, :boolean, default: true
  end
end
