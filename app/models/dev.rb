class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
      matches = self.freebies.filter{|freebie| freebie.item_name == item_name}
      matches.length > 0 ? true : false
    end

    def give_away(dev, freebie)
       puts "dev = #{dev.name} free = #{freebie.item_name}"
       to_give = self.freebies.find{|item| item.id == freebie.id} 
       to_give ? to_give.update(dev_id: dev.id) : "You cannot give away something that isnt yours #{self.name}"
    end
end
