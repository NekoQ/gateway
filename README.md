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
The requests body are the same as from the Specre API.
In case of error, the response status and body are taken from the Spectre API's response.

```shell
api_connections            GET    /api/connections(.:format)
api_customers              POST   /api/customers(.:format)
api_accounts               GET    /api/accounts(.:format)
api_transactions           GET    /api/transactions(.:format)
api_transactions_pending   GET    /api/transactions/pending(.:format)
connection_create_index    GET    /connection/create(.:format)
connection_refresh_index   GET    /connection/refresh(.:format)
connection_reconnect_index GET    /connection/reconnect(.:format)
connection_destroy_index   GET    /connection/destroy(.:format)
accounts                   GET    /accounts(.:format)
transactions               GET    /transactions(.:format)
```