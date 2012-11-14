require 'spec_helper'

module Cacher
	describe LFU do
		before(:each) do
			@new_cache = LFU.new(1)
			@file1 ="./test/new.txt"
			@file2 ="./test/second.txt"
			@file3 ="./test/third.txt"
		end
		context "clear_up_space" do
                  let(:def_value) { mock "def_value" }
			it "should delete " do
			@new_cache.add_to_cache(@file1)
			@new_cache.should_receive(:find_rarely_access).and_return(def_value)
			@new_cache.clear_up_space
			#@new_cache.clear_up_space.should_receive(:find_rarely_access)#:delete).with(@file1)
#WTF? How should it looks like?
			end
		end

	end
end

