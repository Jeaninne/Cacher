require 'spec_helper'

module Cacher
 describe Marshal do
  before(:each) do
   @new_cache = Cache.new(3)
   @file1 ="./test/new.txt"
   @file2 ="./test/second.txt"
   @file3 ="./test/third.txt"
  end

    context "write_in_file" do
     it "should throw an exception if cache is empty" do
      @new_cache.write_in_file("non.txt").should raise_error()
     end
     it "should write cache in file" do
      @new_cache.add_to_cache(@file1)
      @new_cache.add_to_cache(@file2)
      @new_cache.add_to_cache(@file3)
      #@new_cache.should_receive(:dump) #TODO: rewrite this
      @new_cache.write_in_file("new.txt")
      #@new_cache.is_empty?.should be_true
      File.exist?("new.txt").should be_true
      File.size("new.txt").should be > 0
     end
    end

    context "load_from_file" do
     it "should load cache from file correctly" do
      n_cache = Cache.new(1)
      n_cache.load_from_file("new.txt")
      n_cache.cch.include?(@file1).should be_true
      n_cache[@file3].data.should eq("abracadabra!\n")
     end
     it "should throw an exception if file doesn't exist" do
      @new_cache.load_from_file("none.txt").should raise_error()
     end
    end
  end
end
