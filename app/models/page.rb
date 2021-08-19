class Page < ApplicationRecord
	belongs_to :casestudy
	validates : body, uniqueness : true
end
