class Dose < ApplicationRecord
  validates :description, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
  validates :ingredient_id, presence: true, :uniqueness => { :scope => :cocktail_id }
  validates :cocktail_id, presence: true, :uniqueness => { :scope => :ingredient_id }
end
