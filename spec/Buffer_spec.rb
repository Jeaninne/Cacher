require 'spec_helper'

module Cacher
	describe Buffer do
		before(:each) do
			@file1 ="./test/new.txt"
			@file2 ="./test/second.txt"
			@file3 ="./test/third.txt"
		end
		context "initialize" do
			it "should initialize an object buffer" do
			new_buffer = Buffer.new(@file2)
			new_buffer.data.should eq("second file\n")
			end
			it "should throw an exception if index is not string" do
			a = true
			Buffer.new(a).should raise_error()
			end
		end



	end
end

