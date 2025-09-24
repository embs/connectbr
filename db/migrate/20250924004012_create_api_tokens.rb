class CreateApiTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :api_tokens do |t|
      t.references :user
      t.string :value
      t.timestamp :expires_at
      t.boolean :displayed, null: false, default: false

      t.timestamps
    end
  end
end
