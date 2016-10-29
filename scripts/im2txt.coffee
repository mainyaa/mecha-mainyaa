# Description
#   Hubot does morphological analysis
#
# Commands:
#   hubot im2txt <sentence>
#
# Author:
#   mainyaa(Kazuyuki Mori)

module.exports = (robot) ->
  robot.respond /im2txt +(.*)/i, (msg) ->
    # Send POST request
    request = require 'request'
    endpoint = 'http://104.199.219.49:8001/api/url?q=' + msg.match[1]
    request.get
      url: endpoint
    , (err, response, body) ->
      # Reply
      msg.reply "TensorFlow で画像から文字生成したよ\n```\n#{body}\n```"

