# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

members = JSON.parse(File.read(Rails.root.join("db/data/members.json")))
absences = JSON.parse(File.read(Rails.root.join("db/data/absences.json")))

puts "Seeding..."

if Api::V1::Member.count == 0
  members.each do |member|
    Api::V1::Member.create(
      id: member["id"],
      crew_id: member["crewId"],
      image: member["image"],
      name: member["name"],
      user_id: member["userId"],
    )
  end
end

if Api::V1::Absence.count == 0
  absences.each do |absence|
    Api::V1::Absence.create(
      id: absence["id"],
      admitter_id: absence["admitterId"],
      admitter_note: absence["admitterNote"],
      confirmed_at: absence["confirmedAt"],
      created_at: absence["createdAt"],
      crew_id: absence["crewId"],
      end_date: absence["endDate"],
      member_note: absence["memberNote"],
      rejected_at: absence["rejectedAt"],
      start_date: absence["startDate"],
      absence_type: absence["type"],
      user_id: absence["userId"],
    )
  end
end
