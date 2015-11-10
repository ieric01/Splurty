require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
  	quote = FactoryGirl.create(:quote)
  	get :show, :id => quote.id
  	assert_response :success
  end

  test "quote show page, not found" do
  	get :show, :id => 'OMG'
  	assert_response :not_found
  end

  test "create a quote success" do
    quote = FactoryGirl.create(:quote)
    post :create, :quote => 
      quote.attributes
    assert_redirected_to root_path
    quote_saying = Quote.last.saying
    assert_equal quote_saying, quote.saying
  end

  test "create a quote validation error"do
      quote = FactoryGirl.build(:quote, :saying => "ha")
      assert_not quote.save
  end

end
