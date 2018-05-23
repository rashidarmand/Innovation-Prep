require 'test_helper'

class CourseTeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get course_teachers_new_url
    assert_response :success
  end

  test "should get edit" do
    get course_teachers_edit_url
    assert_response :success
  end

  test "should get create" do
    get course_teachers_create_url
    assert_response :success
  end

  test "should get update" do
    get course_teachers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get course_teachers_destroy_url
    assert_response :success
  end

end
