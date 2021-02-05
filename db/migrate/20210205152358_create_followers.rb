class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :followers, references: :users
      t.references :following, references: :users
      t.timestamps
    end
  end
end
