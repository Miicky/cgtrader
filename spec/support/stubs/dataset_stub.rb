# frozen_string_literal: true

# Stub class for dataset import
class DatasetStub
  attr_reader :code, :prompts_count, :offset, :error_message

  LENGTH = 100

  include WebMock::API
  def initialize(prompts_count)
    @prompts_count = prompts_count
    @error_message = Faker::Movies::BackToTheFuture.character
  end

  def dataset(code: 200, offset: 0)
    @code = code
    @offset = offset
    stub_request(:get, "#{url}&length=#{LENGTH}&offset=#{offset}&split=train")
      .to_return(status: code, body: body_response.to_json)
  end

  private

  def body_response
    code == 200 ? success_response_hash : { error_message: }
  end

  def success_response_hash
    {
      rows: array_of_prompompts[offset, LENGTH],
      num_rows_total: prompts_count
    }
  end

  def array_of_prompompts
    @array_of_prompompts ||= Array.new(prompts_count) do |row_idx|
      {
        row_idx:,
        row: { Prompt: "prompt #{row_idx}" },
        truncated_cells: []
      }
    end
  end

  # TODO: Move to credentials

  def url
    'https://datasets-server.huggingface.co/rows?config=default&dataset=Gustavosta/Stable-Diffusion-Prompts'
  end
end
