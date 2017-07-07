class Division < ApplicationRecord
  attr_accessor :number_of_groups
  belongs_to :batch
  has_many :groups
  has_many :challenges

  def self.today
    now = Time.zone.now
    self.where(:created_at => (now.beginning_of_day..now.end_of_day)).first
  end

  def is_today
    created_at.to_date == Date.current
  end

  after_save :build_groups, :if => Proc.new { |model| model.number_of_groups }

  private
  def build_groups
    groups.destroy_all
    student_groups = batch.students.shuffle.in_groups(self.number_of_groups.to_i, false).to_a

    student_groups.each_with_index do |student_group, index|
      group = Group.create(division: self, name: "Group #{index + 1}")
      student_group.each do |student|
        Groupship.create(student: student, group: group)
      end
    end
  end
end
