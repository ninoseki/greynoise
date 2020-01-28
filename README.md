# greynoise

[![Gem Version](https://badge.fury.io/rb/greynoise.svg)](https://badge.fury.io/rb/greynoise)
[![Build Status](https://travis-ci.com/ninoseki/greynoise.svg?branch=master)](https://travis-ci.com/ninoseki/greynoise)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/greynoise/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/greynoise?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/greynoise/badge)](https://www.codefactor.io/repository/github/ninoseki/greynoise)

GreyNoise API wrapper for Ruby.

## Installation

```bash
gem install greynoise
```

## Usage

```ruby
require "greynoise"

# when given nothing, it tries to load your API key via ENV["GREYNOISE_API_KEY"] and `~/.config/greynoise/config`
api = GreyNoise::API.new
# or you can set it manually
api = GreyNoise::API.new(key: YOUR_API_KEY)

api.experimental.gnql(query)
api.experimental.gnql_stats(query)

api.noise.context(ip)
api.noise.quick(ip)
api.noise.multi_quick("1.1.1.1", "8.8.8.8")

api.meta.metadata
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
