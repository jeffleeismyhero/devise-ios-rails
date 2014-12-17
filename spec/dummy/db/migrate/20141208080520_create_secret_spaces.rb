class CreateSecretSpaces < ActiveRecord::Migration
  def change
    create_table :secret_spaces do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
