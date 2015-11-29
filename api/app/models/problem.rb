class Problem < ActiveRecord::Base
  belongs_to :assignment

  enum problem_type: [:multiple_choice, :true_false, :short_answer]
end
