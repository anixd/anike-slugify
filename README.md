# Anike::Slugify

A library for creating slugs with (somewhat quirky) special support for constructed languages (conlangs).
**Based on the excellent [Babosa](https://github.com/norman/babosa) gem by Norman Clarke.**

## Features

- **Preserves meaningful punctuation**: Keeps leading/trailing dashes for linguistic affixes (like `-ri`, `an-`)
- **Handles all apostrophe types**: Converts various Unicode apostrophes to dashes
- **Full transliteration support**: Inherited from Babosa, supports Russian, Latin, Greek, Arabic, and many other scripts
- **Compatible API**: Drop-in replacement for Babosa in most cases

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'anike-slugify', github: 'your-username/anike-slugify'
```

And then execute:

```bash
bundle install
```

## Usage

### Basic Usage

```ruby
require 'anike-slugify'

# Basic slug generation
"Hello World!".to_anike_slug.normalize
# => "hello-world"

# Handles apostrophes
"t'elu".to_anike_slug.normalize
# => "t-elu"

# Preserves affixes by default
"-ri".to_anike_slug.normalize
# => "-ri"

"an-".to_anike_slug.normalize
# => "an-"

# Disable affix preservation
"-ri".to_anike_slug.normalize(preserve_affixes: false)
# => "ri"
```

### With Transliteration

```ruby
# Russian
"Привет мир".to_anike_slug.transliterate(:russian).normalize
# => "privet-mir"

# Mixed text with apostrophes
"История языков anik'e и vel'tari".to_anike_slug.transliterate(:russian).normalize
# => "istoriya-yazykov-anik-e-i-vel-tari"

# Greek
"Γερμανία".to_anike_slug.transliterate(:greek).normalize
# => "germania"
```

### Advanced Options

```ruby
# Fine-grained control over dash preservation
text.to_anike_slug.normalize(
  preserve_leading_dashes: true,   # Keep dashes at start
  preserve_trailing_dashes: false  # Remove dashes at end
)

# All normalize options from Babosa still work
text.to_anike_slug.normalize(
  transliterate: :russian,
  max_length: 100,
  separator: "_"
)
```

## Differences from Babosa

1. **Affixes are preserved by default** - leading/trailing dashes are kept unless explicitly disabled with `preserve_affixes: false`
2. **Extended apostrophe support** - handles ', ', ', `, ´, ʼ and converts them all to dashes
3. **Optimized for conlangs** - designed with linguistic notation in mind

## Supported Languages

Anike::Slugify inherits all transliterators from Babosa:

* Arabic
* Bulgarian
* Danish
* German
* Greek
* Hindi
* Latin
* Macedonian
* Norwegian
* Romanian
* Russian
* Serbian
* Spanish
* Swedish
* Turkish
* Ukrainian
* Vietnamese

## API Compatibility

The gem provides both `to_anike_slug` and `to_slug` methods for easy migration from Babosa:

```ruby
# Both work identically
"text".to_anike_slug.normalize
"text".to_slug.normalize
```

## Credits

### Original Babosa Contributors

This gem is based on [Babosa](https://github.com/norman/babosa), originally created by Norman Clarke.

Babosa has received contributions from many developers. See the [original Babosa repository](https://github.com/norman/babosa#contributors) for the full list of contributors.

### Anike::Slugify Maintainer

- Andrey Gusev ([@anixd](https://github.com/anixd))

## License

MIT License (same as Babosa)

- Original Babosa Copyright (c) 2010-2021 Norman Clarke
- Modifications for `Anike::Slugify` Copyright (c) 2024 Andrey Anikushin

See [LICENSE](MIT-LICENSE) file for details.
