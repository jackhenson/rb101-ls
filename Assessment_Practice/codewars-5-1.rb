def cakes(recipe, available)
  recipe.map {|ingred, amt| available[ingred]/amt}
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200})
