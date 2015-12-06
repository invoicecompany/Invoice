class Order < ActiveRecord::Base
	belongs_to :customer
	serialize :productos, Hash
end
