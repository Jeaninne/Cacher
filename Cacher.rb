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

		def find_new_access
			min_t = Time.now
			min_v = nil
			@cch.each_key{|key| if cch[key].last_accessed<min_t 
				then min_t = cch[key].last_accessed 
					min_v = cch[key]
				else  end}
			return min_v
		end

		def find_old_access()
			max_t = Time.at(0)
			max_v = nil
			@cch.each_key{|key| if cch[key].last_accessed>max_t 
				then max_t = cch[key].last_accessed 
					max_v = cch[key]
				else  end}
			return max_v
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
			@last_accessed = Time.new
			@accesses_count += 1
		end

		def change_access_time
			@last_accessed = Time.new
			@accesses_count += 1
		end
		
	end


end

class Cacher::File < File
	def read(file)
	
	super
	end

	def write(file)
	
	super
	end

end
