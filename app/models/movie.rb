class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  has_many :bookmarks, dependent: :restrict_with_error
end
