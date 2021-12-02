class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
      matches = self.freebies.filter{|freebie| freebie.item_name == item_name}
      matches.length > 0 ? true : false
    end

    def give_away(dev, freebie)
        
    end
end
