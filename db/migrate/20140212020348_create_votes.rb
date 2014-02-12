class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :direction
      t.votable :belongs_to

      t.timestamps
    end
  end
end
