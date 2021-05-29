require "test_helper"

class Api::V1::AbsencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_absence = api_v1_absences(:one)
  end

  test "should get index" do
    get api_v1_absences_url, as: :json
    assert_response :success
  end

  test "should create api_v1_absence" do
    assert_difference("Api::V1::Absence.count") do
      post api_v1_absences_url, params: { absence: { absence_type: @api_v1_absence.absence_type, admitter_id: @api_v1_absence.admitter_id, admitter_note: @api_v1_absence.admitter_note, confirmed_at: @api_v1_absence.confirmed_at, crew_id: @api_v1_absence.crew_id, end_date: @api_v1_absence.end_date, member_note: @api_v1_absence.member_note, rejected_at: @api_v1_absence.rejected_at, start_date: @api_v1_absence.start_date, user_id: @api_v1_absence.user_id } }, as: :json
    end

    assert_response 201
  end
end
