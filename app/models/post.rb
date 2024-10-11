class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { minimum: 140 }
    validates :author, presence: true
    enum published: { 
        unpublished: 0, 
        published: 1
    }
    validates_with AuthorEmailValidator

    
end
  