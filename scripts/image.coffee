# Description
#   Hubot does morphological analysis
#
# Commands:
#   hubot image <sentence>
#
# Author:
#   mainyaa(Kazuyuki Mori)

module.exports = (robot) ->
  robot.respond /class +(.*)/i, (msg) ->
    # Send POST request
    request = require 'request'
    endpoint = 'http://104.199.219.49/api/url?q=' + msg.match[1]
    request.get
      url: endpoint
    , (err, response, body) ->
      # Reply
      list = []
      _.keys body, (k) ->
        obj = {
          name: k
          value: body[k]
        }
        list.append obj
      list = _.sortBy list, "value"
      list = _.map list, (item) -> item.value = (item.value * 100 ) + "%"
      msg.reply "TensorFlow で画像分類したよ\n```\n#{list}\n```"

