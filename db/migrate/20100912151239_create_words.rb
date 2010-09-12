class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :original
      t.string :translation
      t.references :packet, :foreign_key => {:dependent => :destroy}
      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end
end
