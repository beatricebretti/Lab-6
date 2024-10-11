class AddCommentToPost < ActiveRecord::Migration[7.2]
  def change
    change_table :comments do |t|
      t.belongs_to :post, foreign_key: true
    end
  end
end
