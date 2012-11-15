require 'spec_helper'

module Cacher
  describe File do
    before(:each) do
      @file1 ="./test/new.txt"
      @file2 ="./test/second.txt"
      @file3 ="./test/third.txt"
    end

    context "self.factory" do
      it "should " do
      cache = Cacher::Cache.factory('LFU', 2)
      cache.add_to_cache(@file1)
      cache.add_to_cache(@file2)
      cache.add_to_cache(@file3)
      end
    end

  end
end
