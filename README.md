# HomogeneousSelection
A small ruby gem exercise. Given a hash with any amount of strings as keys and arrays as values, and a 'x' required amount of items to select, returns an array with a homogeneous selection of x items, mapped by an unique key.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'homogeneous_selection'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install homogeneous_selection

## Usage

```ruby
source = {
  "logs": [
    {
      "url": "example.com",
      "token": "345048",
      "thumbnail": "example.com",
      "title": "Lorem Ipsum"
    }
  ],
  "content": [],
  "myad": []
}
 =>  {:logs=>[{:url=>"example.com", :token=>"345048", :thumbnail=>"example.com", :title=>"Lorem Ipsum"}], :content=>[], :myad=>[]}

# Optionally, pass options[:map_key] to map by that key in returned array, by default returns the 'token' property
selection = HomogeneousSelection.new(source)
 => #<HomogeneousSelection:0x0055a0e3b100b0 @source={:logs=>[{:url=>"example.com", :token=>"345048", :thumbnail=>"example.com", :title=>"Lorem Ipsum"}], :content=>[], :myad=>[]}, @options={:unique_key=>:token}>

# Optionally, pass the selection size to this method. Default is 4
selection.get
 => [345048]

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mlabarca/homogeneous_selection. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HomogeneousSelection project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mlabarca/homogeneous_selection/blob/master/CODE_OF_CONDUCT.md).
