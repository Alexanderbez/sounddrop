# Sounddrop

A gem that provides audio and track information about a [Soundcloud](https://soundcloud.com/) song given a URL.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sounddrop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sounddrop

## Usage

Being that we're only considering crude track information, there really is no need to do any sort of authentication. All you really need is a `CLIENT_ID` and `CLIENT_SECRET`.

How to get said keys? Easy! Head over to the [Soundcloud developers site] (developers.soundcloud.com) and register your application!

Everything is done via a `Drop` object.

```ruby
drop = Sounddrop::Drop.new(
  client_id: CLIENT_ID,
  client_secret: CLIENT_SECRET
  ) #=> Sounddrop::Drop
```

You can also specify `:username` and `:password` if you'd like.

Now for getting track information:

```ruby
track = drop.get_track(url) #=> Sounddrop::Track
```

```ruby
id = track.id
title = track.title
genre = track.genre
media_url = track.media_url
```

## Contributing

1. Fork it ( https://github.com/Alexanderbez/sounddrop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
