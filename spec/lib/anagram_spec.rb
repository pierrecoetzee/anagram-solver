require 'spec_helper'
require File.join(File.dirname(__FILE__), "../../lib/anagram")

describe Anagram do
    
    describe 'instance variables and class variable instantiation on the class' do
    	it 'should not re-dump marshaled class variable word_hash on re-instantiuation' do

    		a1 = Anagram.new
            a1.instance_variable_get(:@words).should_not  == []
    		a1.class.class_variables.should == [:@@word_hash]
    		a1.class.class_variable_get(:@@word_hash).keys.length.should == 311303

    		b1 = Anagram.new
            a1.instance_variable_get(:@words).should_not  == []
            b1.class.class_variable_get(:@@word_hash).keys.length.should == 311303

    	end

        it 'should return the anagram in a hash' do
            a = Anagram.new
            result = a.get_anagram('loop')
            result.should be_instance_of(Hash)
            result.should == {"loop" => ["polo", "pool"]}
        end
    end
	
end
