require 'test_helper'


class UsersControllerTest < ActionController::TestCase
	
	def setup
		@admin = users(:michael)
		@non_admin = users(:archer)
	end
  
	test "should redirect edit when not logged in as admin" do
		log_in_as(@non_admin)
		get :edit, id: @admin
		assert_not flash.empty?
		assert_redirected_to root_url
	end

	test "should redirect update when not logged in as admin" do
		log_in_as(@non_admin)
		patch :update, id: @admin, user: { name: @admin.name, email: @admin.email }
		assert_not flash.empty?
		assert_redirected_to root_url
	end

  test "should get new" do
    get :new
    assert_response :success
  end

end
