class Racer

# Create a class method (using self prefix) called mongo_client that returns a MongoDB client configured to communicate to the default database specified in the config/mongoid.yml file. 
	def self.mongo_client
	  Mongoid::Clients.default
	end

# Create a class method (using self prefix) called collection that returns the racers MongoDB collection holding the Racer documents.
	def self.collection
	  self.mongo_client['racers']
	end



end