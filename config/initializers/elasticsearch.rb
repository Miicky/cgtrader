# frozen_string_literal: true


Elasticsearch::Model.client = Elasticsearch::Client.new(
  port: ENV.fetch('ES_PORT', 9200),
  host: ENV.fetch('ES_HOST', 'http://elasticsearch'),
  user: ENV.fetch('ES_USER','elastic'),
  password: ENV.fetch('ES_PASSWORD','none')
)
