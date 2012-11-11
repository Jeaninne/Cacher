module CacheFactory
  def create
    raise NotImplementedError # should implement this method
  end
end

class LRUFactory
  include CacheFactory
  def create
    LRU.new 
  end
end

class MRUFactory
  include CacheFactory
  def create
    MRU.new
  end
end

class LFUFactory
  include CacheFactory
  def create
    LFU.new
  end
end
