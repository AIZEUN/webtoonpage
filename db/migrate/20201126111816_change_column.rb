class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
	  change_column(:events, :structure, :text)
  end
end
