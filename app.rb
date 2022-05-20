
require 'sinatra'
require 'slim'

$burger_hash = Hash.new

def randomizer(hash)
    burger_array = []
    if hash.class != NilClass
        hash.map do |ingredient|
            for i in 0..(ingredient[1].to_i - 1)
                burger_array << ingredient[0]
            end
        end
        burger_array = burger_array.shuffle
        burger_array = burger_array.insert(0, "bread_top")
        burger_array = burger_array.insert(-1, "bread_bot")
        return burger_array
    else
        return []
    end
end

get('/') do
    slim(:index, locals:{burger_array:randomizer($burger_hash)})
end

post('/generateburger') do
    params[:bread] = params[:bread].to_i - 2
    $burger_hash = params
    p randomizer($burger_hash)
    redirect('/')
end
