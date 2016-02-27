# Description:
#   Returns a Hearthstone cards's stats
#
# Dependencies:
#   None
#
# Commands:
#   hs me <Hearthstone card> - Return <Hearthstone card>'s information.
#
# Author:
#   Ewan Walker
#

api_key = process.env.HEARTHSTONE_API

module.exports = (robot) ->

  robot.getByName = (json, name) ->
    json.filter (card) ->
      card.name.toLowerCase() is name.toLowerCase()

  robot.respond /hs me *(.+)/, (msg) ->
    more = "test"
    name = msg.match[1]
    additional = more != undefined
    robot.fetchCard msg, name, (card) ->
      robot.sendCard(card, msg, additional)

  robot.fetchCard = (msg, name, callback) ->
    msg.http('https://omgvamp-hearthstone-v1.p.mashape.com/cards/' + name.toLowerCase()).header('X-Mashape-Key', api_key).get() (err, res, body) ->
      try
        data = JSON.parse(body)
        card = robot.getByName(data, name)
        callback(card)
      catch e
        msg.send "I couldn't find that card."

  robot.sendCard = (card, msg, additional) ->
    if card.length > 0
      msg.send "#{card[0].name} | Mana: #{card[0].cost} | Race: #{card[0].race || 'N/A'} | Type: #{card[0].type} | Attack/Health: #{card[0].attack || '-- ' }/#{card[0].health || ' --'} | Desc: #{card[0].text}"
      if additional
        msg.send "Flavor: #{card[0].flavor} || Rarity: #{card[0].rarity}"
        msg.send "#{card[0].img}"
    else
      msg.send "I couldn't find that card."