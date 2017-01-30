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
### Some dependency gems used to make life easier
* bootstrap-sass - Styling
* flickr_fu - Wrapper for Flickr REST Api
* mocha - Mocks and Stubs for Test Cases

### Compromises
Used 

### Good to have
It would have been very brilliant, if I was able to separate the frontend and backend architecture and use a frontend technology like angular and doing the front toa back communication using REST and JSON.

### Best Practices Implemented
The app uses Dependency Injection to inject flickr api so that the code is more flexible enough to make it testable.
The test cases includes integration test which tests the cases like user signups, valid and invalid login, tests image search etc.

