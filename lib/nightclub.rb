require 'active_record'
require 'pg'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "",
  :database => "nightclub"
)

db_conn = PG.connect(:dbname => 'nightclub', :host => '')


class Clubber < ActiveRecord::Base
	validates :name, length: { minimum: 2 }
	validates :age, numericality: { greater_than_or_equal_to: 21 }
	validates :age, numericality: { less_than: 60 }
	validates :gender, inclusion: { in: ['m', 'f']}
	validate :ratio
	validate :format_gender
	
	def ratio
		if self.gender == 'm'
			females = Clubber.where(gender: 'f').count
			males = Clubber.where(gender: 'm').count
			if females <= males * 2
				errors.add(:gender_ratio, "message")
			end
		end
	end

	def format_gender
		return 'female' if self.gender == 'f'
		return 'male' if self.gender == 'm'
	end
end
