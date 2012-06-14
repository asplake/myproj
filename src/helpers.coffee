
class Helpers
	@date_to_string: (date) ->
		if d
			d.toISOString()[0..9]
		else
			''

exports = this
this.h = Helpers
