
class split.Trial

  initialize: (attrs = {}) ->
    @experiment = attrs.experiment
    @alternative = attrs.alternative
    @alternative ||= @experiment?.winner()

  complete: ->
    @alternative?.incrementCompletion()

  chooseAndRecord: ->
    @choose()
    @record()

  choose: ->
    @alternative = @experiment.winner() || @experiment.nextAlternative()

  record: ->
    @alternative?.incrementParticipation()

  alternativeName: (name) ->
    @alternative for alternative in @experiment.alternatives
      when alternative.name == name
