require "test_helper"

class ExecutiveMetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @executive_metric = executive_metrics(:one)
  end

  test "should get index" do
    get executive_metrics_url
    assert_response :success
  end

  test "should get new" do
    get new_executive_metric_url
    assert_response :success
  end

  test "should create executive_metric" do
    assert_difference("ExecutiveMetric.count") do
      post executive_metrics_url, params: { executive_metric: {  } }
    end

    assert_redirected_to executive_metric_url(ExecutiveMetric.last)
  end

  test "should show executive_metric" do
    get executive_metric_url(@executive_metric)
    assert_response :success
  end

  test "should get edit" do
    get edit_executive_metric_url(@executive_metric)
    assert_response :success
  end

  test "should update executive_metric" do
    patch executive_metric_url(@executive_metric), params: { executive_metric: {  } }
    assert_redirected_to executive_metric_url(@executive_metric)
  end

  test "should destroy executive_metric" do
    assert_difference("ExecutiveMetric.count", -1) do
      delete executive_metric_url(@executive_metric)
    end

    assert_redirected_to executive_metrics_url
  end
end
