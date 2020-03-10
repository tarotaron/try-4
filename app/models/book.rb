class Book < ApplicationRecord
 belongs_to :user
 has_many :book_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 def favorited_by?(user)
 	favorites.where(user_id: user.id).exists?
 end
 validates :title, presence: true, length: { in: 1..200 }
 validates :body, presence: true, length: { in: 1..200 }

# book.favorited_by?(current_user)
# 	favorites.where(user_id: current_user.id).exists?

end
