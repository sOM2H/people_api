class SeaBatleController < ApplicationController
    def index
        render json:params, status: 200
    end

    private

    def params
        param.permit(:message)
    end

end
