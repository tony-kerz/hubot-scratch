# Description:
#   calls out to yelp for food info

yelp = require('yelp').createClient
  consumer_key: '357Sp0ySN2lBHXBwZmcKqQ'
  consumer_secret: 'I6nSx5HOuUy-bnjm-cdhfvmvxbQ'
  token: 'ScFp-e8Ik1U1aJCecjfTdlyqWo4Nobca'
  token_secret: 'U26HoqOoCSeLOJK3GZrNsh3X3I8'

module.exports = (robot) ->

  robot.respond /yelp (.*) near (.*)/i, (res) ->
    foodType = res.match[1]
    location = res.match[2]
    #console.log 'res.match=%o', res.match
    res.reply "so you want some #{foodType} near #{location}...?"
    yelp.search
      term: foodType
      location: location
      sort: 2
      limit: 5
      (error, data) ->
        console.log('error=%o', error) if error
        i = 0
        #doc = '\n'
        for b in data.businesses
          #doc += "[#{i++}]: #{b.name}\n#{b.rating_img_url}\n#{b.url}\n"
          res.send "\nname: #{b.name}"
          res.send 'rating: '
          res.send b.rating_img_url
          res.send "url: #{b.url}"
          res.send b.url
        #res.reply doc
