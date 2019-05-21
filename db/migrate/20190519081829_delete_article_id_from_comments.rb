class DeleteArticleIdFromComments < ActiveRecord::Migration[5.1]
  def change
  	remove_column :comments, :article_id
  end
end
