class Dose < ApplicationRecord
  validates :cocktail, uniqueness: { scope: :ingredient }
  validates :description, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
end
