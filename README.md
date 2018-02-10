# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Backend API checklist:

# login/ signup

* worker login     POST /worker_auth/sign_in      :email, :password
* customer login   POST     /customer_auth/sign_in  :email, :password
* worker signup     POST    /worker_auth/           :email, :password
* cus signup        POST       /customer_auth        :email, :password

# cus functions

* customer create new events      POST  /customer_events
* cus get events (belongs to him)   GET /customer_events
* cus get self info                 GET /customers
* cus change self info              PATCH /customers/update/{{params:id}}

# worker functions

* worker get events (all available)    GET /events
* worker choose events ( change event status to on process)   PATCH /events/{params:id}
* worker get finished events (events history)                 GET /events?status=finished
* worker get self info                                        GET /workers
* worker change self info                           PATCH /workers/{{params:id}}
