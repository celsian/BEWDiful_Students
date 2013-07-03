class UrlCodesController < ApplicationController
  def index
    @url_code = UrlCode.new
    @url_codes = UrlCode.all.to_a 
  end

  def create
    if !UrlCode.find_by(code: params[:url])
      redirect_to root_path, flash: {failure: "Url already exists in the database."}
    else
      @url_code = UrlCode.new urlcode_params
      @url_code.code = random
      @url_code.save
    end

  end

  def link_away
    redirect_to UrlCode.find_by(code: params[:code]).url
  end

  def random
    random = "%06d" % rand(0..999999)
    if UrlCode.find_by code: random
      random
    else
      return random
    end
  end

  private
  def urlcode_params
    params.require(:url_code).permit(:url)
  end
end
