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
			max_a = 1
			max_v = nil
			@cch.each_key{|key| if cch[key].accesses_count>max_a 
				then max_a = cch[key].accesses_count
					max_v = cch[key]
				else  end}
			return max_v
		end

	end

	class Buffer
	attr_accessor :created_at, :last_accessed, :accesses_count, :data
		def initialize(path_to_file)
			return raise if path_to_file.class != String
			@created_at = Time.new
			@last_accessed = Time.new
			@accesses_count = 1
			@data = File.open(path_to_file){ |file| file.read_from_file }
		rescue 
		puts "There is no such filename"
		end

		def rewrite(path_to_file)
			@last_accessed = Time.new
			@accesses_count += 1
			@data = File.open(path_to_file){ |file| file.read_from_file }
		end

		def change_access_time
			@last_accessed = Time.new
			@accesses_count += 1
		end
		
	end

#вытесняется буфер, неиспользованный дольше всех;
	class LRU < Cache
		def clear_up_space
		end
	end

# вытесняется последний использованный буфер
	class MRU < Cache
		def clear_up_space
		end
	end

	class LFU < Cache
		def clear_up_space
		end
	end

end

class Cacher::File < File
  	alias :read_from_file :read

	def read(cache)
#		raise "Location does not exist" unless absolute_path(self).exist?
		if cache.key?(self.path)
		then
		cache[self.path].change_access_time
		else
		cache.add_to_cache(self.path)
		end
	end

	def write(string, cache)
		File.open(self.path, "w") { |file|	file.write(string)	}
		if cache.key?(self.path)
		then 
		cache[self.path].rewrite(self.path)
		else
		cache.add_to_cache(self.path)
		end
		
	end

end
