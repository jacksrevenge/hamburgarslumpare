
require 'sinatra'
require 'slim'

burger_arr = []

get('/') do
    slim(:index, locals:{burger_array:burger_arr})
end

post('/generateburger') do
    burger_arr = []
    redirect('/')
end
