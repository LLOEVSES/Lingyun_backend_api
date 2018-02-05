require 'test_helper'

class VersionTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  setup { @ip = '123.123.12.12'}

  test 'returns version one via Accept header' do
    get '/customers', {}, {'REMOTE_ADDR' => @ip, 'Accept' => 'application/vnd.apocalypse.v1+json' }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type

  end
end
