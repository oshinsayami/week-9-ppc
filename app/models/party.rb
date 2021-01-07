class Party < ApplicationRecord
    belongs_to :category
    has_many :supplies
    accepts_nested_attributes_for :category

    accepts_nested_attributes_for :supplies


    def private?
        self.private ? 'Private' : 'Public'
    end    

end
