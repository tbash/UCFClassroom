class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  after_initialize :set_grade

  def set_grade
    assignments = Assignment.where(user_id: self.user_id, course_id: self.course_id)
    base    = []
    quiz    = []
    midterm = []
    final   = []
    assignments.each do |assignment|
      case assignment.assignment_type
        when "base"
          base << assignment.grade.to_f unless assignment.grade.nil?
        when "quiz"
          quiz << assignment.grade.to_f unless assignment.grade.nil?
        when "midterm"
          midterm << assignment.grade.to_f unless assignment.grade.nil?
        when "final"
          final << assignment.grade.to_f unless assignment.grade.nil?
        else
      end
    end
    grade = mean(base) * 0.2 + mean(quiz) * 0.2 + mean(midterm) * 0.3 + mean(final) * 0.3
    byebug
    self.course_grade = grade.to_f unless grade.nil?
  end

  def sum arr
    arr.inject(:+)
  end

  def mean arr
    if arr.empty?
      return 100.0
    end
    sum(arr).to_f / arr.length
  end
end
