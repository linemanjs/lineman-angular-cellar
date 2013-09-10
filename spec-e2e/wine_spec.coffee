require './helpers/spec_helper'

describe "my angular app", ->
  describe "visiting the login page", ->
    ptor = protractor.getInstance()
    Given ->
      post 'covet/routes',
        verb: 'get'
        path: '/api/wines'
        response:
          json: [
            id: 1,
            name: 'AWESOME WINE',
            year: '2009',
            grapes: 'Grenache / Syrah',
            country: 'France',
            region: 'Southern Rhone / Gigondas',
            description: 'The aromas of fruit and spice give one a hint of the light drinkability of this lovely wine, which makes an excellent complement to fish dishes.',
            picture: 'saint_cosme.jpg'
          ]
      , (body, res) ->

      ptor.get "/"

    describe "when a user logs in", ->
      Then -> ptor.findElement(protractor.By.linkText("AWESOME WINE")).click()




