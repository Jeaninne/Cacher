require 'spec_helper'

module Cacher
	describe Buffer do
		context "initialize" do
			it "should initialize an object buffer" do
			path_to_file = "../test/new.txt"
			new_buffer = Buffer.new(path_to_file)
			new_buffer.should be
			end
		end



	end
end
