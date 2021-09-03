
namespace :ingredients do
  task :change_photo, [:ingredient_name] => [:environment] do |t, args|
    Ingredient.where(name: args.ingredient_name).each do |ingredient|
      puts "Changing photo for ingredient ##{ingredient.id}"
      file = URI.open("https://source.unsplash.com/1600x900?#{args[:ingredient_name]}")
      ingredient.photo.attach(io: file, filename: 'ingredient.png', content_type: 'image/png')
    end
  end
end

# Added at 18:08
