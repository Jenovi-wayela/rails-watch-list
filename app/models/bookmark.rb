class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }
  has_one_attached :photo

  belongs_to :movie
  belongs_to :list
end
