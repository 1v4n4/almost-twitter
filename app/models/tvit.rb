class Tvit < ApplicationRecord
  validates :tvit, presence: true, length: { minimum: 5, maximum: 281 }
  belongs_to :user

  scope :latest, -> { order(created_at: :desc) }
  # Ex:- scope :active, -> {where(:active => true)}
end
