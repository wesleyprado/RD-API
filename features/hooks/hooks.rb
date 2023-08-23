# frozen_string_literal: true

Before do
    @buscaCEP = BuscaCEP.new
end

Before do |scenario|
    $service = (scenario.source_tag_names[0]).split('@')[1]
end