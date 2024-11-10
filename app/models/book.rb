class Book < ApplicationRecord
    belongs_to :user
    def self.ransackable_attributes(auth_object = nil)
        ["author", "title"]
      end
end
