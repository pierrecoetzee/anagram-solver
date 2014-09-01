require 'spec_helper'

describe 'login' do 

  fixtures :all
  include LoginSteps
  include ExpectedAnograms

  describe 'unauthenticated navigation' do
  	it 'should not allow unauthenticated users' do
	    visit home_path
	    page.find("#user_user_name").should_not be_nil
	    page.find("#user_password").should_not be_nil
    end
  end

  describe 'authenticated navigation' do
  	it 'navigates to the home controller index successfully' do
  	    login_as_admin_for users(:ministry_of_justice)
  		visit home_path
  		find("#anagram_word").should_not be_nil
  		fill_in "anagram[word]" , with: 'crepitus'
  		find(:xpath, './/input[@type="submit"]').click

  		sleep(2).seconds
  		JSON.parse(find("#results").text).should == {"crepitus" => expected_response['crepitus']}
  	end
  end


	
end