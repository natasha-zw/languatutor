Rails.configuration.stripe = {
  public: Rails.application.credentials.stripe[:public],
  secret_key: Rails.application.credentials.stripe[:secret]
}

Stripe.api_key = Rails.application.credentials.stripe[:secret]