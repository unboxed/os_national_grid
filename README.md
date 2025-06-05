# OsNationalGrid

[![Gem Version](https://badge.fury.io/rb/os_national_grid.svg)](https://badge.fury.io/rb/os_national_grid)

**OsNationalGrid** is a Ruby gem that provides accurate transformations between the [Ordnance Survey National Grid (OSGB36)](https://www.ordnancesurvey.co.uk/documents/resources/guide-coordinate-systems-great-britain.pdf) and WGS84 (latitude/longitude) coordinate systems.

It uses the official mathematical transformations from the Ordnance Survey, including a Helmert transformation for precise conversions between coordinate systems.

---

## Installation

Add to your Gemfile:

```ruby
gem 'os_national_grid'
```
Then install:

```bash
bundle install
```

Or install it manually:

```bash
gem install os_national_grid
```

## Usage

### Convert from OSGB36 (easting, northing) to WGS84 (longitude, latitude)

```bash
lng, lat = OsNationalGrid.os_ng_to_wgs84(481_987.066, 213_552.27)

=> [-0.812036, 51.814605]
```

### Convert from WGS84 (longitude, latitude) to OSGB36 (easting, northing)
```bash
easting, northing = OsNationalGrid.wgs84_to_os_ng(-0.812036, 51.814605)

=> [481987.066, 213552.27]
```

## Development

Run the test suite with:

```bash
bundle exec rake test
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
