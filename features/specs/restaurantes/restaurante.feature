#language: pt

Funcionalidade: Restaurantes    
    Para que eu possa saber quais os restaurantes disponíveis com o tempo de entrega e nota de avaliação
    Sendo um usuário que deseja pedir comida
    Posso acessar a lista de restaurantes

    Cenario: Restaurantes disponiveis  

        Dado que temos os seguintes restaurantes
            #data table
            | nome           | categoria  | entrega    | avaliacao |
            | BREAD & BAKERY | Padaria    | 25 minutos | 4.9       |
            | BURGER HOUSE   | Hamburgers | 30 minutos | 3.5       |
            | COFFEE CORNER  | Cafeteria  | 20 minutos | 4.8       |
        Quando acesso a lista de restaurantes
        Então devo ver todos os restaurantes desta lista
        
    # Contexto: Lista de restaurantes
    #     Dado que eu tenho uma lista de restaurantes

    
    # Cenario: Todos os restaurantes

    #     Quando acesso a lista de restaurantes
    #     Então vejo todas as opções disponíveis

    # Cenario: Categorias

    #     Quando acesso a lista de restaurantes
    #     Então cada restaurante deve exibir sua categoria

    # Cenario: Tempo de entrega

    #     Quando acesso a lista de restaurantes
    #     Então cada restaurante deve exibir o tempo de entrega

    # Cenario: Nota de avaliação

    #     Quando acesso a lista de restaurantes
    #     Então cada restaurante deve exibir sua nota de avaliação
    # @temp
    # Esquema do Cenario: Restaurantes disponiveis

    #     Quando acesso a lista de restaurantes
    #     Então cada restaurante deve ter <id> <nome> <categoria> <entrega> <avaliacao>

    #     Exemplos:
    #         | id | nome             | categoria    | entrega      | avaliacao |
    #         | 0  | "BREAD & BAKERY" | "Padaria"    | "25 minutos" | 4.9       |
    #         | 1  | "BURGER HOUSE"   | "Hamburgers" | "30 minutos" | 3.5       |
    #         | 2  | "COFFEE CORNER"  | "Cafeteria"  | "20 minutos" | 4.8       |


            