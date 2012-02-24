class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :hashtag

      t.timestamps
    end
  end
end
