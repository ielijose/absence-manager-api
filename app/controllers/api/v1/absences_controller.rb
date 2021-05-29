class Api::V1::AbsencesController < ApplicationController
  before_action :set_api_v1_absence, only: [:show, :update, :destroy]

  # GET /api/v1/absences
  def index
    @api_v1_absences = Api::V1::Absence.all

    render json: @api_v1_absences
  end

  # GET /api/v1/absences/1
  def show
    render json: @api_v1_absence
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

  # PATCH/PUT /api/v1/absences/1
  def update
    if @api_v1_absence.update(api_v1_absence_params)
      render json: @api_v1_absence
    else
      render json: @api_v1_absence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/absences/1
  def destroy
    @api_v1_absence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_absence
      @api_v1_absence = Api::V1::Absence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_absence_params
      params.require(:api_v1_absence).permit(:admitter_id, :admitter_note, :confirmed_at, :crew_id, :end_date, :member_note, :rejected_at, :start_date, :absence_type, :user_id)
    end
end
