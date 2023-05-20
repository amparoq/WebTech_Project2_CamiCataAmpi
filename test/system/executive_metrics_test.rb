require "application_system_test_case"

class ExecutiveMetricsTest < ApplicationSystemTestCase
  setup do
    @executive_metric = executive_metrics(:one)
  end

  test "visiting the index" do
    visit executive_metrics_url
    assert_selector "h1", text: "Executive metrics"
  end

  test "should create executive metric" do
    visit executive_metrics_url
    click_on "New executive metric"

    click_on "Create Executive metric"

    assert_text "Executive metric was successfully created"
    click_on "Back"
  end

  test "should update Executive metric" do
    visit executive_metric_url(@executive_metric)
    click_on "Edit this executive metric", match: :first

    click_on "Update Executive metric"

    assert_text "Executive metric was successfully updated"
    click_on "Back"
  end

  test "should destroy Executive metric" do
    visit executive_metric_url(@executive_metric)
    click_on "Destroy this executive metric", match: :first

    assert_text "Executive metric was successfully destroyed"
  end
end
