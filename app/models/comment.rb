class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user, optional: true
    
    validates :content, :author, presence: true
    validates_with AuthorEmailValidator
end
