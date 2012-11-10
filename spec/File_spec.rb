require 'spec_helper'

module Cacher
	describe File do
		before(:each) do
			@new_cache = Cache.new(3)
			@file1 ="./test/new.txt"
			@file2 ="./test/second.txt"
			@file3 ="./test/third.txt"
		end
		context "read" do
			it "should add new file in cache" do
			strng = File.open(@file1){ |file| file.read(@new_cache) }
			@new_cache.key?(@file1).should be_true
			end
#			it "should " do			
#			end
		end

#lol. how should i check that?
		context "write" do
			it "should write text in file" do
			@new_cache.add_to_cache(@file3)
			File.open(@file3){ |file| file.write(@new_cache) }
			@new_cache[@file3].accesses_count.should eq(2)
			end
		end

	end
end
