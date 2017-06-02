class User < ActiveRecord::Base
  #macro, model has password virtual variable and has a password_digest in the table
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items

  validates :username, presence: true

  def get_completed_count
    count = 0
    todo_items.find_each do |item|
      if item.completed
      	count += 1
      end
    end
    return count
  end
end
