# StringInPath

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_in_path'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_in_path

## Usage

### Recursively check to see if the string "Doppler" is present in /home/wbuffett/test:
StringInFile.present("Doppler", "/home/wbuffett/test")

### Recursively replace every instance of "Doppler" with "Next Generation" 
in all files in /home/wbuffett/test:
StringInFile.replace("Doppler", "Next Generation", "/home/wbuffett/test")

## Contributing

1. Fork it ( https://github.com/jhsu802701/string_in_path/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
