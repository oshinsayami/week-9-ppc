class PartiesController < ApplicationController
    def index
        @parties = Party.all
    end

    def new
        @party = Party.new
        @party.build_category
        @party.supplies.build
        @party.supplies.build
        @party.supplies.build
    end

    def create
        @party = Party.new(party_params)
        if @party.save 
            redirect_to party_path(@party)
        else
            render :new
        end
    end

    def show
        @party = Party.find(params[:id])
    end
    
    private
    
    def party_params
        params.require(:party).permit(:date, :budget, :name, category_attributes:[:name], supplies_attributes:[:name])
    end
end
