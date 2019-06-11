class Result < ApplicationRecord
  belongs_to :analysis
  validates :keyword, presence: true, uniqueness: { scope: :analysis }
end
