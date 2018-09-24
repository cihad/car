class ImagesController < ApplicationController
  def destroy
    @image = ActiveStorage::Attachment.find params[:id]
    @image.destroy
    respond_to :js
  end
end
