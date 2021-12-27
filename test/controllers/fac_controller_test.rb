require "test_helper"

class FacControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get fac_input_url
    assert_response :success
  end

  test "should get show" do
    get fac_show_url
    assert_response :success
  end

  test "should get output" do
    get fac_output_url, params: { num: 3 }
    assert_response :success
  end
  test 'should get 1 2 3' do
    post fac_output_url, params: { num: 3 }
    assert_response :success
    assert_equal Fuc.find_by(param: '3').factorial.split(' ').map { |n| Integer(n) }, [1, 2, 3]
  end
  test 'should create db' do

    end
  end
end
