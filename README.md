# Flicker Image Gallery
The Flickr Image Gallery generates image galleries in response to user searches using Flickr REST API.

Features:

* User Management & New User Registration

* Flickr Image Search

* Maintains Recent Search History

## Configuring the Flickr Credentials
```ruby
## config/flickr.yml
--- !map:HashWithIndifferentAccess
key: "YOUR KEY"
secret: "YOUR SECRET"
token_cache: "token_cache.yml"
```

## Installation
```bash
# On the app root
bundle install
```

## Running
```bash
# On the app root
rails server
```

## Testing 
```bash
# On the app root
rake test
```
### Some dependency gems used
* bootstrap-sass
* flickr_fu 
* mocha

### Compromises
* Used opensource flicker api wrapper called flicker_fu.
* Used bootsrap for styling to save time and make life easier, but I guess its more a foundation for styling used by everybody.

### Best Practices Implemented
* The app uses Dependency Injection to inject flickr api so that the code is more flexible enough to make it testable.
* The test cases includes integration test which tests the cases like user signups, valid and invalid login, tests image search etc.
* Used mocks to replace the flicker api while testing so that the code doesnot reach the real, its important to mock external api for testing as there could be connectivity issues, api rate limits, slow response times etc.


### Good to have
It would have been very brilliant, if I was able to separate the frontend and backend architecture and follow the principles of single page application using  a frontend technology like angular and do the front to back communication using REST and JSON.