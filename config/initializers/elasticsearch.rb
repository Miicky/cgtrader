# frozen_string_literal: true

Elasticsearch::Model.client = Elasticsearch::Client.new(
  port: ENV.fetch('ES_PORT', 9200),
  host: ENV.fetch('ES_HOST', 'http://elasticsearch')
)

module Elasticsearch
  # Hot fix for heroku Elasticsearch
  class Client
    def method_missing(name, *, &)
      if name == :perform_request
        begin
          verify_elasticsearch unless @verified
        rescue Elasticsearch::NotElasticsearchError => e
          Warning.warn e.message
          Warning.warn 'Use at your own risk!'
          Warning.warn 'For a supported configuration, connect to an official Elasticsearch distribution.'
          @verified = true # Suppress future warnings
        end
        @transport.perform_request(*, &)
      else
        super
      end
    end
  end
end
