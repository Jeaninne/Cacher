require './Cacher.rb'

module CacheFactory
  def create(c_size)
    raise NotImplementedError # should implement this method
  end
end

class LRUFactory
  include CacheFactory
  def create(c_size)
    Cacher::LRU.new(c_size)
  end
end

class MRUFactory
  include CacheFactory
  def create(c_size)
    Cacher::MRU.new(c_size)
  end
end

class LFUFactory
  include CacheFactory
  def create(c_size)
    Cacher::LFU.new(c_size)
  end
end

class CreateCache
  def initialize(cacher_type, max_size)  
	case cacher_type
	when 'LRU'
		cacher_factory = LRUFactory.new
	when 'MRU'
		cacher_factory = MRUFactory.new
	when 'LFU'
		cacher_factory = LFUFactory.new
	end
    @cache = cacher_factory.create(max_size)
  end

#It seems trouble. We should use method show to get to cache we created
  def show
  @cache
  end
end

#sample
#d = CreateCache.new('LFU', 2)
#d.show.add_to_cache("./test/new.txt")
#p d
