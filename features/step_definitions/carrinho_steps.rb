Dado("que o produto desejado é {string}") do |produto|
    @produto_nome = produto
end
  
Dado("o valor do produto é de {string}") do |valor|
    @produto_valor = valor
end
  
Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    quantidade.times do  #usar o times pra repetir as vezes
        @rest_page.add_to_cart(@produto_nome)# find('.menu-item-info-box', text: @produto_nome.upcase).find('.add-to-cart').click
    end   
end
  
Então("deve ser adicionado {int} unidade\\(s) deste item") do |quantidade|
    # cart_page = CartPage.new #cart = find('#cart')

    expect(@rest_page.cart.box).to have_text "(#{quantidade}x) #{@produto_nome}" #interpolação de strings
end
  
Então("o valor total deve ser de {string}") do |valor_total|
    # cart_page = CartPage.new #cart = find('#cart')
    # total = @cart_page.box.find('tr', text: 'Total:').find('td')

    expect(@rest_page.cart.total.text).to have_text valor_total
end

#lista de produtos

Dado("que os produtos desejados são:") do |table|
    @product_list = table.hashes
end
  
Quando("eu adiciono todos os itens") do
    @product_list.each do |p|
        p["quantidade"].to_i.times do
            @rest_page.add_to_cart(p["nome"]) # find('.menu-item-info-box', text: p["nome"].upcase).find('.add-to-cart').click
        end
    end
end
  
Então("eu vejo todos os itens no carrinho") do
    # cart_page = CartPage.new #cart = find('#cart')
    @product_list.each do |p|
        expect(@rest_page.cart.box).to have_text "(#{p['quantidade']}x) #{p['nome']}"
    end
end

# remover itens

Dado("que eu tenho os seguintes itens no carrinho:") do |table|
    @product_list = table.hashes
    #Dynamic Steps
    steps %{
        Quando eu adiciono todos os itens
    }
    # @product_list.each do |p|
    #     p['quantidade'].to_i.times do
    #         find('.menu-item-info-box', text: p["nome"].upcase).find('.add-to-cart').click
    #     end
    # end
end
  
Quando("eu removo somente o {int}") do |item|
    # cart_page = CartPage.new #cart = find('#cart')
    # @cart_page.box.all("table tbody tr")[item].find(".danger").click
    @rest_page.cart.remove_item(item)
end

Quando("eu removo todos os itens") do
    @product_list.each_with_index do |value, idx|
        # cart_page = CartPage.new #cart = find('#cart')
        #@cart_page.box.all("table tbody tr")[idx].find(".danger").click
        @rest_page.cart.remove_item(idx)
    end
end


Quando("eu limpo o meu carrinho") do
    @rest_page.cart.clean # click_button "Limpar"
end
  
Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|
    # cart_page = CartPage.new #cart = find('#cart')
    expect(@rest_page.cart.box).to have_text mensagem
end

Dado("que adicionei os seguintes itens no carrinho") do |table|
    @product_list = table.hashes
    steps %{
        Quando eu adiciono todos os itens
    }
end
  
Quando("eu fecho o meu carrinho") do
    @rest_page.cart.close
end
  
Então("o valor total de itens deve ser igual a {string}") do |total_itens|
    expect(@order_page.cost_shipping[0]).to have_text total_itens
end
  
Então("o valor do frete deve ser igual a {string}") do |shipping|
    expect(@order_page.cost_shipping[1]).to have_text shipping
end
  
Então("o valor total da compra deve ser igual a {string}") do |total_cart|
    expect(@order_page.cost_shipping[2]).to have_text total_cart
end