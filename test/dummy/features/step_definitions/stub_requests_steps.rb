When /^I request a page$/ do
  visit pages_stubme_path
  @actual_response = "REAL LIVE STUBME"
end

When /^I request a non\-stubbed page$/ do
  visit pages_hitme_path
  @actual_response = "REAL LIVE HITME"
end

When /^I request the stubbed page$/ do
  visit pages_stubme_path
end

Then /^I should see its actual response$/ do
  should have_content(@actual_response)
end

Then /^I should see the stubbed response$/ do
  should have_content('{ "foo": "bar" }')
end
