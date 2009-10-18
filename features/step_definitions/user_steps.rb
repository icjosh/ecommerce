Given /^I create user with name "([^\"]*)" and password "([^\"]*)"$/ do |user, pwd|
  params = { }
  params[:username] = user
  params[:password] = pwd
  params[:password_confirmation] = pwd
  params[:email] = "dummy@example.com"
  user = User.new(params)
  user.save!
end

Given /^I have no users$/ do
  User.delete_all
end

Given /^I am logged in with user "([^\"]*)" and password "([^\"]*)"$/ do |user, pwd|
  visit path_to('the root page')
  click_link('Login')
  fill_in 'Username', :with => user
  fill_in 'Password', :with => pwd
  click_button 'Sign in'
end
