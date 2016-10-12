# Description
#   Hubot does morphological analysis
#
# Commands:
#   hubot image <sentence>
#
# Author:
#   mainyaa(Kazuyuki Mori)

module.exports = (robot) ->
  robot.respond /image (.*)/i, (msg) ->
    # Send POST request
    request = require 'request'
    endpoint = 'https://104.199.219.49/api/url?q=' + msg.match[1]
    request.get
      url: endpoint
    , (err, response, body) ->
      # Reply
      result = JSON.stringify body, null, 2
      msg.reply "TensorFlow で画像分類したよ\n```\n#{result}\n```"

