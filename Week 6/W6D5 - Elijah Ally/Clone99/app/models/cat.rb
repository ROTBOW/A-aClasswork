# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'

class Cat < ApplicationRecord


    def age
        birth_year = self.birth_date.year
        current_year = DateTime.now.year
        current_year - birth_year
    end

    has_many :rentals,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy


end
