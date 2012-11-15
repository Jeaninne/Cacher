require './cacher.rb'

class Cacher::Cache
 def self.factory(type, size)
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

