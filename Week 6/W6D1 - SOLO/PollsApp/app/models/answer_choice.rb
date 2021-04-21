# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  choice      :text             not null
#
class Answer_Choice < ApplicationRecord

    belongs_to :question,
        foreign_key: :question_id,
        class_name: :Question
end
