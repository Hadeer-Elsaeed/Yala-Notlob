class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    # drop_table :groups
    create_table :groups do |t|
      t.string :name
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
