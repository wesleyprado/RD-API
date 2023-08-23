# frozen_string_literal: true

class BuscaCEP
    include HTTParty
    base_uri CONFIG['base_uri']
    format :json
    headers "Content-Type"  => "application/json"

  def getCEP(cep)
    self.class.get("/#{cep}/json")
  end
end