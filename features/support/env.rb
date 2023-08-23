require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'rspec'
require 'cucumber'
require 'pry'
require 'json'
require 'faker'
require "json_matchers/rspec"
require 'cpf_faker'

ENVIRONMENT = ENV['ENVIRONMENT']
SERVICE = ENV['SERVICE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT}.yml")

DATA = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT}/data.yml")

JsonMatchers.schema_root = "./features/contracts/schemas/"

def validate_response_body(payload)
  payload.is_a?(HTTParty::Response) ? payload.body.nil? || payload.to_s.empty? : payload.nil?
end

def print_log(url: nil, payload_envio: nil, payload_resposta: nil, headers: nil)
  log("\n =============== Payload de envio: =============== \n #{JSON.pretty_generate(JSON.parse(payload_envio))}\n") unless validate_response_body(payload_envio)
  log("\n =============== URL: ================ \n #{url.request.last_uri}\n") unless validate_response_body(url)
  log("\n =============== Payload de resposta: =============== \n #{JSON.pretty_generate(JSON.parse(payload_resposta.to_s))}") unless validate_response_body(payload_resposta)
  log("\n =============== Headers: ================ \n #{headers}") unless validate_response_body(headers)
end