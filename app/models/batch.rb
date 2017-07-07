class Batch < ApplicationRecord
  attr_accessor :classmate_html
  has_many :batchships
  has_many :divisions
  has_many :students, through: :batchships

  validates :num, uniqueness: true
  before_validation :parse_classmate_html, :if => Proc.new { |model| model.classmate_html }

  private
  def parse_classmate_html
    self.batchships.delete_all

    html_doc = Nokogiri::HTML(self.classmate_html)

    student_rows = html_doc.search('#classmates-container tbody > tr')
    student_rows.each do |student_row|
      student_cols = student_row.search('td')

      avatar = student_cols[0].at_css('.img-thumbnail').attribute('src').value
      name = student_cols[1].at_css('strong').text

      student = Student.find_by(name: name)
      if !student
        student = Student.create(name: name, avatar_url: avatar)
      end

      Batchship.create(student: student, batch: self)
    end
  end
end
