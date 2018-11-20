class TicTacToeController < ApplicationController
    def single
        params.permit!
        render json: {}, status: 422 unless params[:code]
        render json: params, status: 200
    end

    def multi_generate
        params.permit!
        render json: {}, status: 422 unless params[:code]
        hash = rand(2**256).to_s(36).ljust(8,'a')[0..15]
        #system("cd ../code && echo + #{params[:code]} > "+hash+"_1.code")
        open("app/code/"+hash+"_1.code", "w") do |f|
           f.puts params[:code]
        end
        Multi.create(:token => hash)
        render json: hash, status: 200
    end

    def multi_accept
        params.permit!
        render status:422 unless params[:token]
        render status:422 unless params[:code]
        open("app/code/"+params[:token]+"_2.code", "w") do |f|
           f.puts params[:code]
        end
        Multi.where(:token => params[:token]).first.delete
        system("cd app/code && rm "+params[:token]+"_1.code"+" && rm "+params[:token]+"_2.code")
        ans = war
        render json: ans , status: 200
    end

    private

    def war(fc = 1, sc = 2)
        return 1
    end
end
