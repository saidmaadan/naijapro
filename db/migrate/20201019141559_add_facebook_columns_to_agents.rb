class AddFacebookColumnsToAgents < ActiveRecord::Migration[6.0]
  def change
    add_column :agents, :provider, :string
    add_column :agents, :uid, :string
    add_column :agents, :image, :string
  end
end
