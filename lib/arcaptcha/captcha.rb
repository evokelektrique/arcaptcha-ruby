# frozen_string_literal: true

module Arcaptcha
  # Base class for validating and displaying captcha for Arcaptcha.
  class Captcha
    attr_reader :site_key, :secret_key

    def initialize(site_key, secret_key)
      @site_key = site_key
      @secret_key = secret_key
    end

    def verify(challenge_id)
      raise ArgumentError, "challenge_id cannot be empty" if challenge_id.nil? || challenge_id.empty?

      verify_url = "https://api.arcaptcha.ir/arcaptcha/api/verify"
      data = { site_key: @site_key, secret_key: @secret_key, challenge_id: challenge_id }

      response = Faraday.post(verify_url) do |req|
        req.headers["Content-Type"] = "application/json"
        req.body = data.to_json
      end

      validate(response.body)
    end

    # Parse and validate response body
    def validate(body)
      raise ArgumentError, "body cannot be empty" if body.nil? || body.empty?

      parsed = JSON.parse(body)

      if parsed.key? "success"
        true
      else
        false
      end
    end

    # Print captcha HTML tag
    def display
      "<div class='arcaptcha' data-site-key='#{@site_key}'></div>"
    end

    # Print API script tag
    def self.display_tag
      "<script src='https://widget.arcaptcha.ir/1/api.js' async defer></script>"
    end
  end
end
