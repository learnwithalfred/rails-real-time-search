class Article < ApplicationRecord
  MIN_LENGTH = 2
  MAX_LENGTH = 250
  validates :name, presence: true, length: { minimum: MIN_LENGTH, maximum: MAX_LENGTH }
end
