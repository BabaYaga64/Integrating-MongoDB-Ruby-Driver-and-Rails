module RacersHelper
  # Add an instance method to the generated RacersHelper class called toRacer. The new method must:
	# Accept a single input argument.
	# If the type of the input argument is a Racer, simply return the instance unmodified. Else attempt to instantiate a Racer from the input argument and return the result.
	def toRacer(value)
	  return value.is_a?(Racer) ? value : Racer.new(value)
	end
end
