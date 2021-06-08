class Tvit < ApplicationRecord
  validates :tvit, presence: true, length: { minimum: 5, maximum: 281 }
  belongs_to :user
end
