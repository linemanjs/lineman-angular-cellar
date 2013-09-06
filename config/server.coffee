wines = [
  id: 1,
  name: 'CHATEAU DE SAINT COSME',
  year: '2009',
  grapes: 'Grenache / Syrah',
  country: 'France',
  region: 'Southern Rhone / Gigondas',
  description: 'The aromas of fruit and spice give one a hint of the light drinkability of this lovely wine, which makes an excellent complement to fish dishes.',
  picture: 'saint_cosme.jpg'
,
  id: 2,
  name: 'LAN RIOJA CRIANZA',
  year: '2006',
  grapes: 'Tempranillo',
  country: 'Spain',
  region: 'Rioja',
  description: 'A resurgence of interest in boutique vineyards has opened the door for this excellent foray into the dessert wine market. Light and bouncy, with a hint of black truffle, this wine will not fail to tickle the taste buds.',
  picture: 'lan_rioja.jpg'
,
  id: 3,
  name: 'MARGERUM SYBARITE',
  year: '2010',
  grapes: 'Sauvignon Blanc',
  country: 'USA',
  region: 'California Central Cosat',
  description: 'The cache of a fine Cabernet in ones wine cellar can now be replaced with a childishly playful wine bubbling over with tempting tastes of\nblack cherry and licorice. This is a taste sure to transport you back in time.',
  picture: 'margerum.jpg'
,
  id: 4,
  name: 'OWEN ROE \"EX UMBRIS\"',
  year: '2009',
  grapes: 'Syrah',
  country: 'USA',
  region: 'Washington',
  description: 'A one-two punch of black pepper and jalapeno will send your senses reeling, as the orange essence snaps you back to reality. Don\'t miss\nthis award-winning taste sensation.',
  picture: 'ex_umbris.jpg'
,
  id: 5,
  name: 'REX HILL',
  year: '2009',
  grapes: 'Pinot Noir',
  country: 'USA',
  region: 'Oregon',
  description: 'One cannot doubt that this will be the wine served at the Hollywood award shows, because it has undeniable star power. Be the first to catch\nthe debut that everyone will be talking about tomorrow.',
  picture: 'rex_hill.jpg'
]
wineId = 6

_ = require('grunt').util._

module.exports = drawRoutes: (app) ->
  app.get "/api/wines", (req, res) ->
    res.json(wines)

  app.get "/api/wines/:id", (req, res) ->
    wine = wineById(req.params.id)
    res.json(wine)

  app.post "/api/wines", (req, res) ->
    wine = if req.body.id
      _(wineById(req.body.id)).extend(req.body)
    else
      _(_(req.body).extend(id: wineId++)).tap (wine) -> wines.push(wine)

    res.json(wine)

  app.delete "/api/wines/:id", (req, res) ->
    wines = _(wines).reject (wine) -> wine.id == parseInt(req.params.id, 10)
    res.send(200)

wineById = (id) ->
  _(wines).find (wine) -> wine.id == parseInt(id,10)
