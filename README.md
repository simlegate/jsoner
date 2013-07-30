# Jsoner

Serialize HTML tables into JSON in Ruby.  
[![Build Status](https://travis-ci.org/simlegate/jsoner.png?branch=master)](https://travis-ci.org/simlegate/jsoner)

## Installation

Add this line to your application's Gemfile:

    gem 'jsoner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsoner

## Usage

```ruby
html = <<-eohtml
    <table id='example-table'>
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Points</th></tr>
      </thead>
      <tbody>
        <tr>
          <td>Jill</td>
          <td>Smith</td>
          <td>50</td></tr>
        <tr>
          <td>Eve</td>
          <td>Jackson</td>
          <td>94</td></tr>
        <tr>
          <td>John</td>
          <td>Doe</td>
          <td>80</td></tr>
        <tr>
          <td>Adam</td>
          <td>Johnson</td>
          <td>67</td></tr>
      </tbody>
    </table>
  eohtml

# Convert HTML table into Json

json = Jsoner.parse(html)

# output json => 
# 
#   [ {"First Name"=>"Jill", "Last Name"=>"Smith",   "Points"=>"50"},
#     {"First Name"=>"Eve",  "Last Name"=>"Jackson", "Points"=>"94"},
#     {"First Name"=>"John", "Last Name"=>"Doe",     "Points"=>"80"},
#     {"First Name"=>"Adam", "Last Name"=>"Johnson", "Points"=>"67"} ]

```

Or, `Jsoner` can parse HTML file including HTML table

```ruby
# you must have table.html file and assign file path correctly.

table = Jsoner.parse('table.html')
```
## THANKS

[table-to-json](https://github.com/lightswitch05/table-to-json) written by [@lightswitch05](https://github.com/lightswitch05) in JavaScript.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
