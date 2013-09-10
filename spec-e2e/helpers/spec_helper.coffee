root = global

root.protractor = require "protractor"
root.request = require "request"
require "protractor/jasminewd"
require "jasmine-given"

root.get = (path, callback) ->
  request {url: urlFor(path), json: true}, handle(callback)

root.post = (path, params, callback) ->
  request.post {url: urlFor(path), json: params}, handle(callback)

urlFor = (path) ->
  "http://localhost:8000/#{path}"

handle = (callback) ->
  (err, res, body) ->
    callback?(body, res, err)
