# frozen_string_literal: true

elastic_main_config = {
  port: ENV.fetch('ES_PORT', 9200),
  host: ENV.fetch('ES_HOST', 'http://elasticsearch')
}

elastic_prod_config = {
  user: ENV.fetch('ES_USER', 'elastic'),
  password: ENV.fetch('ES_PASSWORD', 'none')
}

full_elastic_main_config = Rails.env.production? ? elastic_main_config.merge(elastic_prod_config) : elastic_main_config
Elasticsearch::Model.client = Elasticsearch::Client.new(full_elastic_main_config)
