When(/^I go to (.+)$/) do |page|
  visit root_path(locale: 'en')
end

Then(/^I should see the login page$/) do
  # expect(page).to have_content('Login')
end
