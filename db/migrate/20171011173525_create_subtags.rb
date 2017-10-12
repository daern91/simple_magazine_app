class CreateSubtags < ActiveRecord::Migration[5.0]
  def change
    create_table :subtags do |t|
      t.string :title
      # t.references :tag, foreign_key: true
      # t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
