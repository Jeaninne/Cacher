require 'spec_helper'

module Cacher
	describe Cache do
		context "initialize" do
			it "should initialize a cache with given size" do
			new_cache = Cache.new(5).should be
			end
		end
	end
end
