# Knife::SavedSearch

Proof of concept Knife plugin for managing and executing saved searches against
a Chef server. As a proof of concept, it uses a data bag to store saved
searches.

## Installation

Using [ChefDK](downloads.chef.io/chef-dk/), run:

    chef gem install knife-saved_search

## Usage

By default a data bag named "saved-searches" is used to store searches. This
can be set to something else by putting
`knife[:saved_search][:data_bag] = "my-data-bag-name"` in your .chef/config.rb.

This data bag will be created if it does not exist when a saved search is first
created.

A saved search data bag item looks like:

```json
{
  "id": "name-of-saved-search",
  "index": "node", // The search index used
  "description": "A description of the search",
  "query": "*:* " // The search query string used
}
```

### `knife saved search list`

Lists names of all saved searches.

### `knife saved search show NAME`

Shows an individual saved search.

### `knife saved search delete NAME`

Deletes a saved search.

### `knife saved search create NAME INDEX QUERY [DESCRIPTION]`

Creates a saved search.

### `knife saved search exec NAME`

Executes a saved search and returns its results.

## Development

To use this plugin from the code in this repository:

```bash
ln -sf /path/to/knife-saved_search/lib/chef/knife/* ~/.chef/plugins/knife/
```

## Testing

Run `bundle exec rake` to run the RSpec test suite.

## Contributing

1. Fork it ( https://github.com/smith/knife-saved_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Knife::SavedSearch - A Knife plugin for saved search on a Chef server

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Nathan L Smith (<smith@chef.io>)
| **Copyright:**       | Copyright (c) 2015 Nathan L Smith
| **License:**         | Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
