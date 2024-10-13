class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    
    validates :content, :author, presence: true
    validates_with AuthorEmailValidator
end
