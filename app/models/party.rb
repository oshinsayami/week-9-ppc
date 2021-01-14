class Party < ApplicationRecord
    belongs_to :category
    has_many :supplies
    accepts_nested_attributes_for :category
    accepts_nested_attributes_for :supplies
    scope :order_by_budget, -> { order("budget DESC") }
    scope :expensive, -> (amount) { where("budget > ?", amount)}
    scope :orders_by_category_name, -> { joins(:category).order("categories.name") }
    scope :search_by_name, -> (name) { where("name LIKE ?", "%#{name}%")}

    # def order_by_budget
    #    # Party.all.sort_by {|p| p.budget }
    #    Party.order("budget DESC")
    # end


    def private?
        self.private ? 'Private' : 'Public'
    end    

end
