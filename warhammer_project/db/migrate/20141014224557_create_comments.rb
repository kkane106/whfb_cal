class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.references :user
  		t.references :post
  		t.string :comment

  		t.timestamps
  	end
  end
end
