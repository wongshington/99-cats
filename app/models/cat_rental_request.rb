class CatRentalRequest < ApplicationRecord
  STATUSES = %w[PENDING APPROVED DENIED]

  validates :status, :inclusion => {:in=> STATUSES,
    :message => "status is invalid" }

  validates :status, :start_date, :end_date, :cat_id, presence: true

  belongs_to :cat

  def overlapping_requests
    requests = CatRentalRequest
    .where(cat_id: self.cat_id)
    .where.not(id: self.id)
    .where.not("? > end_date OR ? < start_date", self.start_date, self.end_date)
  end
end
