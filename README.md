slicket-api
===========

SlicketTicket API


###Testing

We use rspec for testing.

First, make sure to setup your testing db:

```
rake db:drop RAILS_ENV=test #if necessary
rake db:create RAILS_ENV=test
rake db:migrate RAILS_ENV=test
```

To run the rspec tests, from your root directory, simply run `rspec`

A code coverage report will be generated in `[root_dir]/coverage/index.html` that can be opened in a browser.
