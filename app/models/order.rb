class Order < ActiveRecord::Base
	
	serialize :productos, Hash
end
