# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#
class Response < ApplicationRecord

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :question,
        foreign_key: :question_id,
        class_name: :Question
    
    belongs_to :answer,
        foreign_key: :answer_choice_id,
        class_name: :Answer_Choice
end
