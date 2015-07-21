chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'lastfm', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/lastfm')(@robot)

  it 'registers a response for what is playing with username', ->
    expect(@robot.respond).to.have.been.calledWith(/what'?s (.*) playing/i)

  it 'registers a response for what is playing without username', ->
    expect(@robot.respond).to.have.been.calledWith(/what(')?s playing/i)

  it 'registers a response for setting lastfm account', ->
    expect(@robot.respond).to.have.been.calledWith(/my lastfm is (.*)/i)
