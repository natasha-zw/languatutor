class SubjectsController < ApplicationController

    def index
        @subjects = Subject.all
    end
    def test
        
    end
end
