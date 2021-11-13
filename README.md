<h1>
  <img src="https://arcaptcha.ir/logo.png" width="80" />
  Arcaptcha
  
  <!-- Badges -->
  <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/evokelektrique/arcaptcha-ruby/Ruby?style=flat-square">
  <img alt="GitHub" src="https://img.shields.io/github/license/evokelektrique/arcaptcha-ruby?color=blue&label=LICENSE&style=flat-square">
  <img alt="Gem" src="https://img.shields.io/gem/v/arcaptcha?style=flat-square">
</h1>

Arcaptcha library in Ruby


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arcaptcha'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install arcaptcha

## Usage

```ruby
# Display script tag
Arcaptcha::Captcha.display_tag # => <script src='https://widget...

# Initialize base class
arcaptcha = Arcaptcha::Captcha.new("your_site_key", "your_secret_key")

# Display captcha HTML tag
arcaptcha.display # => <div class='arcaptcha'...

# Verify challenge_id
arcaptcha.verify("challenge_id") # => true or false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/evokelektrique/arcaptcha-ruby.
