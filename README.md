# Lingyun Backend API

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.3.3(windows)

* Deployment: https://lingyun-web-api.herokuapp.com/

API checklist:

# login/ signup

* worker login     POST /worker_auth/sign_in      :email, :password
* customer login   POST     /customer_auth/sign_in  :email, :password
* worker signup     POST    /worker_auth/           :email, :password
* cus signup        POST       /customer_auth        :email, :password

# cus functions

* cus create new events      POST  /customer_events
  will get: type, details, area, address, time_slot
* cus get events (belongs to him)   GET /customer_events
  will send back: type, details, area, address, time_slot
* cus get self info                 GET /customers
  will get: name, address, email, cellphone
* cus change self info              PATCH /customers/update/{{params:id}}
  may get several of: name, address, email, cellphone

# worker functions

* worker get events (all available)    GET /events
* worker choose events ( change event status to on process)   PATCH /events/{params:id}
* worker get finished events (events history)                 GET /events?status=finished
* worker get self info                                        GET /workers
* worker change self info                           PATCH /workers/{{params:id}}
