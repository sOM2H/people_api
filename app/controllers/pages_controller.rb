class PagesController < ApplicationController
    def index
        render json:{}, status: 401
    end
end
