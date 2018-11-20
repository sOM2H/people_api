class TicTacToeController < ApplicationController
    def single
        params.permit!
        if params[:code]
          render json: params, status: 200
        else
          render json: {}, status: 422
        end
    end

    def multi
        params.permit!
        if params[:first_code] && params[:second_code]
          render json: params, status: 200
        else
          render json: {}, status: 422
        end
    end
end
