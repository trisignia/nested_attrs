class CreateInteractions < ActiveRecord::Migration
  def self.up
    create_table :interactions do |t|
      t.references :team
      t.references :user
      t.references :role
      t.timestamps
    end
  end

  def self.down
    drop_table :interactions
  end
end
