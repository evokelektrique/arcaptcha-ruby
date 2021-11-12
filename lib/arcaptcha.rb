# frozen_string_literal: true

require_relative "arcaptcha/version"
require_relative "arcaptcha/captcha"
require "faraday"
require "json"

module Arcaptcha
  class Error < StandardError; end
end
