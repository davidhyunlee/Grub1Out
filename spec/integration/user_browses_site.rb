require 'spec-helper'

feature "user visits home page" do 
	scenario "successfully sees home page" do 
		visit root_path
	end
end