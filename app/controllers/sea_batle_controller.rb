class SeaBatleController < ApplicationController
  def single
    params.permit!
    render json: {}, status: 422 unless params[:code]
    render json: params, status: 200
  end

  def multi_generate
    params.permit!
    render json: {}, status: 422 unless params[:code]
    hash = rand(2**256).to_s(36).ljust(8,'a')[0..15]
    open("app/code/"+hash+"_1.code", "w") do |f|
      f.puts params[:code]
    end
    Multi.create(:token => hash)
    render json: hash, status: 200
  end

  def multi_accept
    params.permit!
    unless params[:token]
      render status: 422
    end
    unless params[:code]
      render status: 422
      return
    end
    if Multi.where(:token => params[:token]).empty?
      render status: 422
      return
    end
    open("app/code/"+params[:token]+"_2.code", "w") do |f|
      f.puts params[:code]
    end
    Multi.where(:token => params[:token]).first.delete
    system("cd app/code && rm "+params[:token]+"_1.code"+" && rm "+params[:token]+"_2.code")
    ans = war(params[:token])
    render json: ans , status: 200
  end

  private

  def war(token)
    return 1
  end
end
