#language: pt
#encoding: utf-8

Funcionalidade: Gerenciar solicitações de credenciamento
    Como um admnistrador do sistema
    Quero visualizar uma solicitação de credencimento em aberto
    Para decidir se vou aceitar ou recusar tal solicitação

    Contexto:
        Dado que as seguintes solicitações estejam pendentes:
        | title         | due_date    | activity_type_id              |
        | Solicitação 1 | 02-Jan-2021 | Solicitação de credenciamento |
        | Solicitação 2 | 02-Jan-2021 | Solicitação de credenciamento |
        | Solicitação 3 | 02-Jan-2021 | Solicitação de credenciamento |
        | Solicitação 4 | 02-Jan-2021 | Solicitação de credenciamento |

        E que eu estou cadastrado e logado como "Gabriel", "gabriel@admin.com", "gabriel123", "administrator", "200000000"
        E que eu estou na página de solicitações de credenciamento
    
    Cenário: Aceitar uma solicitação de credenciamento
        Quando eu clico em "Solicitação 1"
        Então eu devo estar na página da "Solicitação 1"
        Quando eu clico em "Aprovar"
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu desmarco os seguintes estados: Rejeitadas, Reformulação
        E eu marco os seguintes estados: Aprovadas
        E aperto 'Atualizar'
        Então eu devo ver "Solicitação 1"
    
    Cenário: Recusar uma solicitação de credenciamento
        Quando eu clico em "Solicitação 2"
        Então eu devo estar na página da "Solicitação 2"
        Quando eu clico em "Rejeitar"
        Então eu devo estar na página de solicitações de credenciamento
        Quando eu desmarco os seguintes estados: Aprovadas, Reformulação
        E eu marco os seguintes estados: Rejeitadas
        E aperto 'Atualizar'
        Então eu devo ver "Solicitação 2"
