class CrewMember < ActiveRecord::Base
  belongs_to :starship
  accepts_nested_attributes_for :starship,
    reject_if: lambda {|attributes| attributes["name"].blank?}
  has_many :holodeck_programs, through: :starship
end
