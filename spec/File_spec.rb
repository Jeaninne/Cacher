require 'spec_helper'

module Cacher
	describe File do
		before(:each) do
			@new_cache = Cache.new(3)
			@file1 ="../test/new.txt"
			@file2 ="../test/new1.txt"
			@file3 ="../test/new2.txt"
		end
		context "read" do
			it "should add new file in cache" do
			@file1.read(@new_cache)
			@new_cache.key?(@file1).should be_true
			end

		end


	end
end
