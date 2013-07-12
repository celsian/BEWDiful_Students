class UrlCodesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @url_code = UrlCode.new
    @url_codes = UrlCode.all.to_a
  end

  def create
      url = format_url params[:url_code][:url]
      @url_code = UrlCode.new
      @url_code.url = url
      @url_code.code = random

      if UrlCode.find_by(url: url)
        redirect_to root_path, flash: {error: "Url exists, code is: #{UrlCode.find_by(url: url).code}"}
      else
        @url_code.save
        redirect_to root_path, flash: {notice: "Url created, code is: #{UrlCode.find_by(url: url).code}"}
      end
  end

  def link_away
    redirect_to (UrlCode.find_by(code: params[:code]).url)
  end

  def format_url url
      if url.include?("http://") || url.include?("https://")
        return url
      else
        url = "http://" + url
        format_url url
      end
  end
          
  def random
    number = "%06d" % rand(0..999999)
    if UrlCode.find_by code: number
      random
    else
      return number
    end
  end
  
  def destroy
    UrlCode.find(params[:id]).destroy
    redirect_to root_path, flash: {error: "Url and Code deleted."}
  end

  private
  def urlcode_params
    params.require(:url_code).permit(:url)
  end
end
