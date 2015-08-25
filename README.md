# telefon

Formats a number into a US phone number (e.g: (555) 123-9876).
You can customize the format in the options hash.

## Usage

```ruby
require "telefon"

Telefon.convert(5551234)                                     # => 555-1234
Telefon.convert("5551234")                                   # => 555-1234
Telefon.convert(1235551234)                                  # => 123-555-1234
Telefon.convert(1235551234, area_code: true)                 # => (123) 555-1234
Telefon.convert(1235551234, delimiter: " ")                  # => 123 555 1234
Telefon.convert(1235551234, area_code: true, extension: 555) # => (123) 555-1234 x 555
Telefon.convert(1235551234, country_code: 1)                 # => +1-123-555-1234

Telefon.convert(1235551234, country_code: 1, extension: 1343, delimiter: '.')
# => +1.123.555.1234 x 1343
```

## Installation

```
$ gem install telefon
```
