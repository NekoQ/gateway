## Gateway

You can visit this app on: gatewayedge.herokuapp.com

This app uses:

* Ruby version: `2.7.3`
* Rails version: `6.1.4.1`
* Database: `postgresql`

## Running it locally
- run `bundle && yarn`
- run `rails db:prepare`
- run `rails s`
- navigate to `http://localhost:3000`

## Routes
```shell
connection_create_index    POST    /connection/create(.:format)
connection_refresh         PUT     /connection/refresh/:id(.:format)
connection_reconnect       PUT     /connection/reconnect/:id(.:format)
connection_destroy         DELETE  /connection/destroy/:id(.:format)
accounts                   GET     /accounts(.:format)
transactions               GET     /transactions(.:format)
```