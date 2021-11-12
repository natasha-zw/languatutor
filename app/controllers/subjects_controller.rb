class SubjectsController < ApplicationController

    def index
        @subjects = Subject.all
    end
    # GET /orders/1 or /orders/1.json
   def show
   end
end
