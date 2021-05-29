class Api::V1::Absence < ApplicationRecord
  belongs_to :member, foreign_key: :user_id, :primary_key => "user_id"

  scope :filter_by_type, ->(type) { where absence_type: type }
  scope :filter_by_from, ->(from) { where("start_date >= ?", from) }
  scope :filter_by_to, ->(to) { where("end_date <= ?", to) }
end
