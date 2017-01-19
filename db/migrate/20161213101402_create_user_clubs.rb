class CreateUserClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_clubs do |t|
      t.references :user, foreign_key: true
      t.references :club, foreign_key: true
      t.boolean :is_manager, default: false
      t.references :status, foreign_key: true, default: 1
      t.timestamps
    end
  end
end
