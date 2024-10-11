class Comment < ApplicationRecord
    belongs_to :post
    
    validates :content, :author, presence: true
    validates_with AuthorEmailValidator
end
