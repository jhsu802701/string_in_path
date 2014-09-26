# StringInPath

This gem allows you to check every file in a given directory for the presence
of a given substring and to replace that substring with a different substring.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_in_path'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_in_path

## Examples

### StringInFile.present("Doppler", "/home/wbuffett/test")
Recursively check to see if the string "Doppler" is present in any files
in /home/wbuffett/test:


### StringInFile.replace("Doppler", "Next Generation", "/home/wbuffett/test")
Recursively replace every instance of "Doppler" with "Next Generation" 
in all files in /home/wbuffett/test:


## Contributing

1. Fork it ( https://github.com/jhsu802701/string_in_path/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
