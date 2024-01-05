# frozen_string_literal: true

# Organize email-related methods centrally.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
