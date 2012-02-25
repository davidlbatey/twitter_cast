# Twitter Cast

This was built as a minimal viable product at a westminster hub hack night. It takes in a list of streams
and displays them in a nice format. It's fine for running internally but I wouldn't run externally unless
you wanted world ending chaos to ensue.

You can see a demo at: http://youtu.be/AZ_iBGLtqfI

## Todo

- Use websockets to update the content (at the moment it will refresh after 3 mins)
- Allow users to collate users or lists of tweets instead of just a general twitter search
- Add security to the app
- Add functional and integration tests
- Add more transitions on the front end
- Refactor/rewrite impress js - it's crap at the moment

## Installation

Clone the repo

```
git clone git@github.com:davidlbatey/twitter_cast.git
```

Register a new app at dev.twitter.com and update the initializer at:
config/initializers/twitter.rb

Update the app configuration to customize it:
config/app_config.yml

Start the app

```
bundle install
bundle exec rails s
```

Set up the hastags

```
http://127.0.0.1:3000/streams/
```

Then see the magic

```
http://127.0.0.1:3000/
```

## Contributing

Pull requests would be awesome if anyone wants to improve the app.
