require './cacher.rb'

class Cacher::Cache
 def self.factory(type, size)
#eval('type')
 case type
  when 'LRU'
   Cacher::LRU.new(size)
  when 'MRU'
   Cacher::MRU.new(size)
  when 'LFU'
   Cacher::LFU.new(size)
  end
 end
end

#sample
#d = Cacher::Cache.factory('LFU', 2)
#d.show.add_to_cache("./test/new.txt")
#p d
