# Bug::Inspector

Welcome to bug inspector ! A simple gem to retrieve an error sample in Appsignal, if you are find in the app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bug-inspector'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bug-inspector

## Configuration

Configure the app by creating a `inspector.yml` file at the root of your app, and write down your appsignal credentials :

```yaml
token: MY_GREAT_APPSIGNAL_API_TOKEN
app_id: MY_AMAZING_APPSIGNAL_APP_ID
```

## Usage

The inspector will let you use two methods to retrieve a sample :

### `#list` all occurrences of an error

To list all occurrences of a specific exception do :
```ruby
BugInspector.list(
  exception: "BaseCRM::ErrorsCollection", # required
  method: "SellTracking::CreateOrUpdateDealWorker#perform", # required
  since: Time.now.to_i - 604800, # optional, in Timestamp default to 7 days ago
  limit: 100, # optional, default to 200
  count_only: false, # optional, default to false
)
```

### `#find` a specific occurence of an error

To find a specific occurrence, and list all details and metadata for this event do :
```ruby
BugInspector.find("5ea04dfgt18f54321c70e4f1") # an error occurrence id, you can retrieve it by listing all occurrences of an error
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bug-inspector. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/williampollet/bug-inspector/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bug::Inspector project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/williampollet/bug-inspector/blob/master/CODE_OF_CONDUCT.md).
