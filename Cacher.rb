module Cacher
	class Cache
		attr_accessor :cch, :size
		def initialize(c_size)
			@cch = Hash.new
			@size = c_size
		end

		def [](index)
			@cch[index]
		end

		def key?(index)
			@cch.key?(index)
		end

		def add_to_cache(path_to_file)
			@cch[path_to_file] = Buffer.new(path_to_file)
		end

		def delete_from_cache(path_to_file)
			@cch.delete(path_to_file)
		end

		def find_by_key(path_to_file)	
			if (@cch.has_key?(path_to_file)) then return @cch[path_to_file] else return nil end
		end

		def is_full?
			@cch.size < @size ? (return false) : (return true)
		end

		def find_new_access()
		end

		def find_old_access()
		end

		def find_rarely_access()
		end

	end

	class Buffer
	attr_accessor :created_at, :last_accessed, :accesses_count, :data
		def initialize(path_to_file)
			@created_at = Time.new
			@last_accessed = Time.new
			@accesses_count = 1
#			@data
		end

		def rewrite(path_to_file)
		end

		def change_access_time
			@last_accessed = Time.new
			@accesses_count += 1
		end
		
	end


end

class Cacher::File < File
	def read(file)
	end

end
