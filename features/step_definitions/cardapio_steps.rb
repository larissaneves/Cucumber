Dado("que acesso a lista de restaurantes") do 
    @rest_list_page.load # visit '/restaurants' 
end

Quando("eu escolho o restaurante {string}") do |restaurant|
    @rest_list_page.go(restaurant)# find(".restaurant-item", text: restaurant.upcase).click
end

Então("vejo os seguintes itens disponíveis no cardápio:") do |table|
    itens = @rest_page.menu # all('.menu-item-info-box')

    product_data = table.hashes

    product_data.each_with_index do |value, index|
        expect(itens[index]).to have_text value ['produto'].upcase
        expect(itens[index]).to have_text value ['descricao']
        expect(itens[index]).to have_text value ['preco']
    end
end

Então("eu vejo as seguintes informações adicionais:") do |table|
    infos = table.rows_hash #cada linha em objeto de hash
    detail = @rest_page.details # find('#detail')
    expect(detail).to have_text infos['categoria']
    expect(detail).to have_text infos['descricao']
    expect(detail).to have_text infos['horarios']
end