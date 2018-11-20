class TicTacToeController < ApplicationController
    def index
        render json:param, status: 200
    end

    private

    def param
        params.permit(:message)
    end

end
