
class Helpers
	@dateString: (date) ->
		if date
			date.toISOString()[0..9]
		else
			''

exports = this
this.h = Helpers
