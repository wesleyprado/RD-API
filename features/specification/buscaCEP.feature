#language: pt
#encoding: UTF-8

@CEP @regression
Funcionalidade: Buscar um CEP

  @happy-flow
  Cenario: Buscar um CEP
    Dado que tenha um cep "Valido"
    Quando requisito o serviço
    Então o sistema retorna o status 200
    E eu valido os dados de contrato do serviço

  @bad-flow
  Cenario: Buscar um CEP Invalido
    Dado que tenha um cep "Invalido"
    Quando requisito o serviço
    Então o sistema retorna o status 200
    E uma mensagem de erro

  