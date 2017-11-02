class AddUploaderToZernikes < ActiveRecord::Migration
  def change
    add_column :zernikes, :attachment, :string
  end
end
