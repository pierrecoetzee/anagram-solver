require 'spec_helper'

describe HomeController do

	fixtures :all

	include LoginSteps
	include ExpectedAnograms

	describe 'anagram index' do

		before(:each){
		  login_as_admin_session users(:ministry_of_justice)
		}

		it 'should present the anagram form' do
			get 'index'
			response.should be_success
			session[:user_id].should == users(:ministry_of_justice).id
		end

		it 'should return the result for crepitus' do
			get 'anagram_word_lookup', {'anagram' => {'word' => 'crepitus' }, format: :json}
			response.should be_success
			assigns(:word).should == 'crepitus'
			assigns(:anagram).should be_instance_of( Anagram )
			JSON.parse(response.body)["crepitus"].should == expected_response['crepitus']
		end

		it 'should respond to calls within a second' do
			expected_response.each do |k,v|
				get 'anagram_word_lookup', {'anagram' => {'word' => k }, format: :json}
				response.should be_success
				JSON.parse(response.body)[k].should == expected_response[k.to_s]
		    end
		end
	end


end