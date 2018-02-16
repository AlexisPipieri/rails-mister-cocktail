require 'open-uri'
require 'json'

puts 'Cleaning databases...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

Cocktail.create(name: 'Cuba Libre')
Dose.create(description: '4cl', cocktail_id: 4, ingredient_id: 629)
Dose.create(description: '2cl', cocktail_id: 4, ingredient_id: 630)
