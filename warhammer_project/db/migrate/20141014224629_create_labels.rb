class CreateLabels < ActiveRecord::Migration
  def change
  	create_table :labels do |t|
  		t.references :tag
  		t.references :post

  		t.timestamps
  	end
  end
end
