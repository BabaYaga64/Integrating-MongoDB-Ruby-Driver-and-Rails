class Racer
# Add attributes to the Racer class that allow one to set/get each of the following properties: id, number, first_name, last_name, gender, group, secs
  attr_accessor :id, :number, :first_name, :last_name, :gender, :group, :secs

# Create a class method (using self prefix) called mongo_client that returns a MongoDB client configured to communicate to the default database specified in the config/mongoid.yml file. 
	def self.mongo_client
	  Mongoid::Clients.default
	end

# Create a class method (using self prefix) called collection that returns the racers MongoDB collection holding the Racer documents.
	def self.collection
	  self.mongo_client['racers']
	end

	# Create a class method called "all" that must: 
	# Accept an optional prototype, optional sort, optional skip, and optional limit. 
	# Is to “match all” – which means you must provide it a document that matches all records. The default for sort must be by number ascending. The default for skip must be 0 and the default for limit must be nil.
	# Find all racers that match the given prototype.
	# Sort them by the given hash criteria.
	# Skip the specified number of documents.
	# Limit the number of documents returned if limit is specified.
	# Return the result.
	def self.all(prototype={}, sort={}, skip=0, limit=nil)
 	  result = collection.find(prototype).sort(sort).skip(skip)
 	    if limit then result.limit(limit)
 	    else result 
 	    end
	end

	# Add an initializer that can set the properties of the class using the keys from a racers document. It must:
	# Accept a hash of properties.
	# Assign instance attributes to the values from the hash.
	# For the id property, this method must test whether the hash is coming from a web page [:id] or from a
	# MongoDB query [:_id] and assign the value to whichever is non-nil.
	def initialize(params={})
	  @id = params[:_id].nil? ? params[:id] : params[:_id].to_s
	  @number = params[:number].to_i
	  @first_name = params[:first_name]
	  @last_name = params[:last_name]
	  @gender = params[:gender]
	  @group = params[:group]
	  @secs = params[:secs].to_i
	end

end