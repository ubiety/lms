When(/^I visit a page as a guest$/) do
  visit root_path
end

Then(/^I should see the login page$/) do
  expect(page).to have_content('Login')
end
