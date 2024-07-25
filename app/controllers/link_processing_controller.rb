class LinkProcessingController < ApplicationController
  def process_link
    link = Link.find_by(token: params[:token])

    if link
      redirect_to link.full_link, allow_other_host: true
    else
      render :not_found
    end
  end
end
