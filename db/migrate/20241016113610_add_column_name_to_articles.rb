class AddColumnNameToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :author, :string, default: 'JK Rowling'
  end
end
