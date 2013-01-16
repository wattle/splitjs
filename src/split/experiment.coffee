
# TODO fill out more and setup the project to compile to one js
# testing should work right too
class split.Experiment

  initialize: (name, options={}) ->
    options.resettable = true unless options.resettable
    @options = @options
    @name = name
    @alternatives = options.alternatives
    @algorithm = options.algorithm || split.configuration.algorithm

    if options.alternativeNames && !@alternatives
      @alternatives = options.alternativeNames.map (alternative) ->
         new split.Alternative(alternative, name)

  winner: ->
    # TODO look into this a bit more
    if name = split.storage.get('experiment_winner', @name)
      new split.Alternative(name, @name)

  participantCount: ->
    #      alternatives.inject(0){|sum,a| sum + a.participant_count}


  control: ->
    @alternatives.first

  resetWinner: ->
    # figure out what the winner is?


  nextAlternative: ->
    @winner() || @randomAlternative()

  randomAlternative: ->
    if @alternatives.length > 1
      @algorithm.chooseAlternative(@)
    else
      @alternatives.first
    end




