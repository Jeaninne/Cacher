require 'spec_helper'

module Cacher
	describe Cache do
		context "initialize" do
			it "should initialize a cache with given size" do
			new_cache = Cache.new(5)
			new_cache.should be #that's not fail:(
			new_cache.size.should eq(5)
			end
		end

		context "add in the cache" do
			it "should add file in the cache" do
			new_cache = Cache.new(5)
			path_to_file = "../test/new.txt"
			new_cache.add_to_cache(path_to_file)		
			new_cache.key?(path_to_file).should be_true
			end				
		end

		context "delete from cache" do
			it "should delete file of cache" do
			new_cache = Cache.new(5)
			path_to_file = "../test/new.txt"
			new_cache.add_to_cache(path_to_file)		
			new_cache.delete_from_cache(path_to_file)
			new_cache.key?(path_to_file).should be_false
			end
		end

		context "find by key" do
			it "should check if cache include file" do
			new_cache = Cache.new(5)
			path_to_file = "../test/new.txt"
			new_cache.add_to_cache(path_to_file)	
			new_cache.find_by_key(path_to_file).class.should eq(Buffer)
			end
			it "should throw an exception if there is no such file" do
			new_cache = Cache.new(5)
			path_to_file = "../test/new.txt"
			new_cache.add_to_cache(path_to_file)
			path_to_file1 = "../test/new1.txt"	
			new_cache.find_by_key(path_to_file1).should be_nil
    			end
		end

		context "full cache" do
			it "should return 'true' if the cache is full" do
			new_cache = Cache.new(3)
			path_to_file = "../test/new.txt"
			new_cache.add_to_cache(path_to_file)
			path_to_file = "../test/new1.txt"
			new_cache.add_to_cache(path_to_file)	
			path_to_file = "../test/new2.txt"
			new_cache.add_to_cache(path_to_file)		
			new_cache.is_full?.should be_true
			end
			it "should return 'false' if the cache isn't full" do
			new_cache = Cache.new(3)
			path_to_file = "../test/new.txt"
			new_cache.add_to_cache(path_to_file)
			path_to_file = "../test/new1.txt"
			new_cache.add_to_cache(path_to_file)		
			new_cache.is_full?.should be_false
			end
		end

	end
end
