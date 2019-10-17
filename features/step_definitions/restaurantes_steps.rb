Dado("que temos os seguintes restaurantes") do |table|
    @restaurants_data = table.hashes
end

  
Quando("acesso a lista de restaurantes") do
    @rest_list_page.load # visit '/restaurants'  
end
  
Então("devo ver todos os restaurantes desta lista") do
    restaurants = @rest_list_page.list # all('.restaurant-item')

    @restaurants_data.each_with_index do |value, index|
        expect(restaurants[index]).to have_text value['nome']
        expect(restaurants[index]).to have_text value['categoria']
        expect(restaurants[index]).to have_text value['entrega']
        expect(restaurants[index]).to have_text value['avaliacao']
    end
end



# Dado("que eu tenho uma lista de restaurantes") do
#     @restaurante_data = [
#         { name: 'BREAD & BAKERY', category: 'Padaria', delivery_time: '25 minutos', rating: 4.9},
#         { name: 'BURGER HOUSE', category: 'Hamburgers', delivery_time: '30 minutos', rating: 3.5},
#         { name: 'COFFEE CORNER', category: 'Cafeteria', delivery_time: '20 minutos', rating: 4.8}
#     ]
# end

  
# Então("vejo todas as opções disponíveis") do
#     restaurantes = all('.restaurant-item')  # o método all devolve uma coleção de elementos (array)
#     expect(restaurantes.size).to be > 0 # o método size devolve a quantidade de itens
#     #expect(restaurantes.size).to eql 6
#     #puts restaurantes.class # tipo
# end

# Então("cada restaurante deve exibir sua categoria") do

#     restaurants = all('.restaurant-item')

#     @restaurante_data.each_with_index do |value, index|
#         expect(restaurants[index]).to have_text value[:category]
#     end
# end
  
# Então("cada restaurante deve exibir o tempo de entrega") do

#     restaurants = all('.restaurant-item')

#     @restaurante_data.each_with_index do |value, index|
#         expect(restaurants[index]).to have_text value[:delivery_time]
#     end
# end
  
# Então("cada restaurante deve exibir sua nota de avaliação") do
    
#     restaurants = all('.restaurant-item')

#     @restaurante_data.each_with_index do |value, index|
#         expect(restaurants[index]).to have_text value[:rating]
#     end
# end

# Então("cada restaurante deve ter {int} {string} {string} {string} {float}") do |id, name, category, delivery_time, rating|
#     restaurants = all('.restaurant-item')

#     expect(restaurants[id]).to have_text name
#     expect(restaurants[id]).to have_text category
#     expect(restaurants[id]).to have_text delivery_time
#     expect(restaurants[id]).to have_text rating

# end

