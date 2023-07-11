class Post < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  
  validates :title, presence: true
  validates :content, presence: true
  validates :address, presence: true

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  belongs_to :user

  def destroy
    update(deleted_at: Time.now)
  end
end
