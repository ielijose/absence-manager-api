class Api::V1::AbsencesController < ApplicationController

  # GET /api/v1/absences
  def index
    @absences = Api::V1::Absence.where(nil)

    @absences = @absences.filter_by_type(params[:type]) if params[:type].present?
    @absences = @absences.filter_by_from(params[:from]) if params[:from].present?
    @absences = @absences.filter_by_to(params[:to]) if params[:to].present?

    @pagy, @absences = pagy(@absences, items: 10)

    render json: {
             data: @absences,
             meta: pagy_metadata(@pagy),
           }, include: [:member]
  end

  # POST /api/v1/absences
  def create
    @api_v1_absence = Api::V1::Absence.new(api_v1_absence_params)

    if @api_v1_absence.save
      render json: @api_v1_absence, status: :created, location: @api_v1_absence
    else
      render json: @api_v1_absence.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def api_v1_absence_params
    params.require(:absence).permit(:admitter_id, :admitter_note, :confirmed_at, :crew_id, :end_date, :member_note, :rejected_at, :start_date, :absence_type, :user_id)
  end
end
