require './buffer.rb'
require './file.rb'

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

    def find_old_access
      max_t = Time.at(0)
      max_v = nil
      @cch.each_key{|key| if cch[key].last_accessed>max_t 
      then max_t = cch[key].last_accessed 
        max_v = cch[key]
      else  end}
      return max_v
    end

    def find_rarely_access
      max_a = 1
      max_v = nil
      @cch.each_key{|key| if cch[key].accesses_count>max_a 
      then max_a = cch[key].accesses_count
        max_v = cch[key]
      else  end}
      return max_v
    end

#		def to_yaml_properties
#		%w{ @cch.created_at @cch.last_accessed @cch.accesses_count @cch.data}
#		end	

#		def to_s
#		"#@cch.created_at #@cch.last_accessed #@cch.accesses_count #@cch.data"
#		end
	
  end



#вытесняется буфер, неиспользованный дольше всех;
#TODO: write this
  class LRU < Cache
    def clear_up_space
#      self.delete(self.key(self.find_old_access))
    end
  end

# вытесняется последний использованный буфер
#TODO: write this
  class MRU < Cache
    def clear_up_space
#      self.delete(self.key(self.find_new_access))
    end
  end

  class LFU < Cache
    def clear_up_space
      del_value = self.find_rarely_access
      self.cch.delete(self.cch.key(del_value))# переписать через delete_if
    end
  end

end


