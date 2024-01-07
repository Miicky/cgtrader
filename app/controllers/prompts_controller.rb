# frozen_string_literal: true

# Handles prompts-related actions and logic.
class PromptsController < ApplicationController
  def index
    @prompts = Prompt.search(params[:search])
  end
end
