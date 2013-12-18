# SystemLog

View the system log of the gem.

## Installation

Add this line to your application's Gemfile:

    gem 'system_log'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install system_log

## Usage

set config/routes.rb

  #The development environment，load log/development.log

    if Rails.env == "development" 
      mount SystemLog::Engine, :at => "/system_log" 
    end

  call on http:localhost.com:3000/system_log

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
