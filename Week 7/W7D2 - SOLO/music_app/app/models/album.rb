# == Schema Information
#
# Table name: albums
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  year           :integer          not null
#  band_id        :integer          not null
#  live_or_studio :boolean          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Album < ApplicationRecord
    validates :title, :year, :band_id, :live_or_studio, presence: true

    belongs_to :band
end
