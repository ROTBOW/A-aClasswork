# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
    validates :start_date, :end_date, :status, presence: true
    validate :not_overlapping?

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def check_overlaps
        appoints = CatRentalRequest.where(cat_id: self.cat_id)
        all_requests = []
        appoints.each do |appt|
            # current end_date after appt.start_date || appt.end_date
            if appt.status == "APPROVED"
                if appt.start_date <= self.start_date && self.start_date <= appt.end_date 
                    self.status = "DENIED"
                    all_requests << appt
                else
                    self.status = "APPROVED" 
                end
            end 
        end

        all_requests
    end

    def not_overlapping?
        unless check_overlaps.empty?
            errors[:status] << 'Request are overlapped.'
            return false
        end
    end



end
