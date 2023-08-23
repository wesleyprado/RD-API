Given("que tenha um cep {string}") do  |type|
  @cep = DATA['DATA']["#{type}CEP"]['CEP1']
end

When("requisito o serviço") do
  @response = @buscaCEP.getCEP(@cep)
end

Then("o sistema retorna o status 200") do
  print_log(url: @response)
  print_log(headers: @response.headers)
  print_log(payload_resposta: @response)
  expect(@response.code).to eq(200)
end

Then("eu valido os dados de contrato do serviço") do
  expect(@response).to match_json_schema('buscaCEP')
end

Then("uma mensagem de erro") do
  print_log(url: @response)
  print_log(headers: @response.headers)
  print_log(payload_resposta: @response)
  expect(@response['erro']).to eq(true)
end