class AuthorEmailValidator < ActiveModel::Validator
    def validate(record)
      unless User.exists?(email: record.author)
        record.errors.add(:author, "must be an existing user's email")
      end
    end
  end
  