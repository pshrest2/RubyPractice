class MainController < ApplicationController
    def index
        flash[:success] = "Testing"
    end
end
