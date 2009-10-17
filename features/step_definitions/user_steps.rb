Given /^I have user with name "([^\"]*)" and password "([^\"]*)"$/ do |user, pwd|
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
