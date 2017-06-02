class AddUsersToTodoLists < ActiveRecord::Migration
  def change
    add_reference :todo_lists, :user, index: true
    add_foreign_key :todo_lists, :users
  end
end
