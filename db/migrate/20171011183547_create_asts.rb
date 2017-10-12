class CreateAsts < ActiveRecord::Migration[5.0]
  def change
    create_table :asts do |t|
      t.belongs_to :article, index: true
      t.belongs_to :tag, index: true
      t.belongs_to :subtag, index: true

      t.timestamps
    end
  end
end
