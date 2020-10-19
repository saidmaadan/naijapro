class AddLastNameToAgents < ActiveRecord::Migration[6.0]
  def change
    add_column :agents, :lastname, :string
  end
end
