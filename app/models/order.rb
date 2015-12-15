class Order < ActiveRecord::Base
	belongs_to :customer
	serialize :productos, Hash


    before_create :set_date
    
    def get_current_date
        return Date.today
    end
    
    def set_date
        self.fecha_entrega = self.get_current_date
    end


end
