def ask_about_pokemons

    puts "How many pokemons to add?"
    number_of_pokemons = gets.to_i
    if (number_of_pokemons > 0)
        pokemons = []
        number_of_pokemons.times do
            pokemon = {}
            puts "What's the name of the pokemon?"
            name_of_pokemon = gets.chomp 
            puts "What color is the pokemon?"
            color_of_pokemon = gets.chomp 
            pokemon[:name] =  name_of_pokemon
            pokemon[:color] =  color_of_pokemon
            pokemons.push(pokemon)
        end
    else
        puts "Incorrect number of pokemons :("
        return []
    end
    puts pokemons
end

ask_about_pokemons