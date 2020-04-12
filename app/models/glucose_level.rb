class GlucoseLevel < ApplicationRecord
	validates :glucose, presence: true, numericality: { only_integer: true }
	validates_uniqueness_of :glucose, scope: [:user_id], conditions: -> { where("DATE(created_at) = ?", Date.today) }
	validate :check_limitation_of_user, on: :create
	
	belongs_to :user

	def check_limitation_of_user
	  errors.add(:glucose, I18n.t("glucose_levels.validations.limit_msg")) if self.number_of_entries == 4
	end

	def number_of_entries
		self.class.name.constantize.where("DATE(created_at) = ? AND user_id = ?", Date.today, self.user_id).count if self.glucose.present?
	end
end
