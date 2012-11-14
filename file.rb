require './cacher.rb'
module Cacher

class File < File
 alias :read_from_file :read
  def read(cache)
      if cache.key?(self.path)
       then cache[self.path].change_access_time
       else cache.add_to_cache(self.path)
      end
      return cache[self.path].data
  end

  def write(string, cache)
      File.open(self.path, "w") {|file| file.write(string)}
      if cache.key?(self.path)
       then cache[self.path].rewrite(self.path)
       else
        cache.clear_up_space if cache.is_full? #there are no tests for this case coz of method clean_up_space
        cache.add_to_cache(self.path)
       end
      super(string)
  end
end

end
