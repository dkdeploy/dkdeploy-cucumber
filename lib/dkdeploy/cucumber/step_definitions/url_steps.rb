# frozen_string_literal: true

# Open given url.
#
# @yieldparam page_name [String] Name of page to open.
Given(/^(?:|I )am on "([^"]*)"$/) do |page_name|
  visit path_to(page_name)
  status_code = page.status_code.to_s # CODE_TO_OBJ matches string the net http class
  expect(Net::HTTPResponse::CODE_TO_OBJ).to include(status_code)
  response = Net::HTTPResponse::CODE_TO_OBJ[status_code].allocate # create a dummy instance to easily check the error type
  expect(response).not_to be_a Net::HTTPClientError
  expect(response).not_to be_a Net::HTTPServerError
  expect(response).not_to be_a Net::HTTPError
end

# Check current url.
#
# @yieldparam page_name [String] Page to test.
Then(/^(?:|I )should be on "([^"]*)"$/) do |page_name|
  current_path = URI.parse(current_url).path
  expect(current_path).to eq path_to(page_name)
end

# Check current url query parameters.
#
# @yieldparam expected_pairs [String] GET Parameter to test.
Then(/^(?:|I )should have the following query string:$/) do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair { |k, v| expected_params[k] = v.split(',') }
  expect(actual_params).to eq expected_params
end
