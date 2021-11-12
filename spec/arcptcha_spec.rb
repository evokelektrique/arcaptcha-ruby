# frozen_string_literal: true

RSpec.describe Arcaptcha do
  it "has a version number" do
    expect(Arcaptcha::VERSION).not_to be nil
  end
end

RSpec.describe Arcaptcha::Captcha do
  before do
    @site_key = "example_site_key"
    @secret_key = "example_secret_key"
    @arcaptcha = Arcaptcha::Captcha.new(@site_key, @secret_key)
    @good_response = "{\"success\": true}"
    @bad_response = "{\"status\": 404, \"message\": \"Challenge not exist\"}"
  end

  it "displays script tag" do
    script_tag = "<script src='https://widget.arcaptcha.ir/1/api.js' async defer></script>"
    expect(Arcaptcha::Captcha.display_tag).to eq(script_tag)
  end

  it "displays captcha html tag" do
    captcha = "<div class='arcaptcha' data-site-key='#{@site_key}'></div>"
    expect(@arcaptcha.display).to eq(captcha)
  end

  it "validates good response" do
    expect(@arcaptcha.validate(@good_response)).to be(true)
  end

  it "validates bad response" do
    expect(@arcaptcha.validate(@bad_response)).to be(false)
  end
end
