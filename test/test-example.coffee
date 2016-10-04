Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/onboard.coffee')

describe 'onboard new hacker', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'says a public message', ->
    @room.user.say('stephane', 'onboard @arthur').then =>
      expect(@room.messages).to.eql [
        ['stephane', 'onboard @arthur'],
        ['hubot', 'Glad to see a new face! Onboarding @arthur right now']
      ]

  it 'send a private message to pay', ->
    @room.user.say('stephane', 'onboard @arthur 28/10').then =>
      expect(@room.messages).to.eql [
      ]
      #   {
      #   'arthur': [
      #     ['hubot', 'Bonjour à toi jeune padawan !']
      #     ['hubot', "La HackerHouse est prêt à t'accueillir à partir du 28/10."]
      #     ['hubot', "Pour réserver ta place il faut que tu confirme ton paiement"]
      #     ['hubot', "Quel est ton numéro de carte bleu ?"]
      #   ]
      # }
  # it 'doesn\'t need badgers', ->
  #   @room.user.say('alice', 'did someone call for a badger?').then =>
  #     expect(@room.messages).to.eql [
  #       ['alice', 'did someone call for a badger?']
  #       ['hubot', 'Badgers? BADGERS? WE DON\'T NEED NO STINKIN BADGERS']
  #     ]

  # it 'won\'t open the pod bay doors', ->
  #   @room.user.say('bob', '@hubot open the pod bay doors').then =>
  #     expect(@room.messages).to.eql [
  #       ['bob', '@hubot open the pod bay doors']
  #       ['hubot', '@bob I\'m afraid I can\'t let you do that.']
  #     ]

  # it 'will open the dutch doors', ->
  #   @room.user.say('bob', '@hubot open the dutch doors').then =>
  #     expect(@room.messages).to.eql [
  #       ['bob', '@hubot open the dutch doors']
  #       ['hubot', '@bob Opening dutch doors']
  #     ]