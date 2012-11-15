require 'spec_helper'

module Cacher
  describe Cache do
   before(:each) do
    @new_cache = Cache.new(3)
    @file1 ="./test/new.txt"
    @file2 ="./test/second.txt"
    @file3 ="./test/third.txt"
   end
   context "initialize" do
    it "should initialize a cache with given size" do
     @new_cache.should be
     @new_cache.size.should eq(3)
    end
   end

   context "add in the cache" do
    it "should add file in the cache" do
     @new_cache.add_to_cache(@file1)		
     @new_cache.key?(@file1).should be_true
     @new_cache.cch.size.should eq(1)
    end				
   end

   context "delete from cache" do
    it "should delete file of cache" do
     @new_cache.add_to_cache(@file1)		
     @new_cache.delete_from_cache(@file1)
     @new_cache.key?(@file1).should be_false
     @new_cache.cch.size.should eq(0)
    end
   end

   context "find by key" do
    it "should check if cache include file" do
     @new_cache.add_to_cache(@file1)	
     @new_cache.find_by_key(@file1).class.should eq(Buffer)
    end
    it "should return nil if there is no such file" do
     @new_cache.add_to_cache(@file1)	
     @new_cache.find_by_key(@file2).should be_nil
    end
   end

  context "find file with last access" do
   it "should find buffer with most 'fresh' access" do
    @new_cache.add_to_cache(@file2)	
    @new_cache.add_to_cache(@file1)	
    @new_cache.find_new_access.should eq(@new_cache[@file2])
   end
   it "should return nil if the cache is empty" do
    @new_cache.find_new_access.should be_nil
   end
  end

  context "find file with oldest access" do
    it "should find buffer with oldest access" do
     @new_cache.add_to_cache(@file2)	
     @new_cache.add_to_cache(@file1)	
     @new_cache.add_to_cache(@file1)	
     @new_cache.find_old_access.should eq(@new_cache[@file1])
    end
    it "should return nil if the cache is empty" do
     @new_cache.find_old_access.should be_nil
    end
  end

  context "find file with the least number of accesses" do
    it "should find buffer with the least number of accesses" do
     @new_cache.add_to_cache(@file2)	
     @new_cache.add_to_cache(@file1)	
     @new_cache[@file1].change_access_time
     @new_cache.cch.size.should eq(2)
     @new_cache.find_rarely_access.should eq(@new_cache[@file1])
    end
    it "should return nil if the cache is empty" do
     @new_cache.find_rarely_access.should be_nil
   end
  end

  context "full cache" do
    it "should return 'true' if the cache is full" do
     @new_cache.add_to_cache(@file1)
     @new_cache.add_to_cache(@file2)	
     @new_cache.add_to_cache(@file3)		
     @new_cache.is_full?.should be_true
    end
    it "should return 'false' if the cache isn't full" do
     @new_cache.add_to_cache(@file1)
     @new_cache.add_to_cache(@file2)		
     @new_cache.is_full?.should be_false
    end
   end
  end
end
