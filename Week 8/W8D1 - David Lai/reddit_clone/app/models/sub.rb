# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :integer          not null
#
class Sub < ApplicationRecord
    validates :title, :description, presence: true

    belongs_to :moderator,
        class_name: 'User',
        foreign_key: :moderator_id

    has_many :posts,
        class_name: 'Post',
        foreign_key: :sub_id

end
