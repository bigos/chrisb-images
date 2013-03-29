class BulkUploadController < ApplicationController
  def new
    @photo = Photo.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def create
    @photo = Photo.new(params[:photo])
    2/0
    respond_to do |format|
      if @photo.save
        format.html { render :json => [@photo.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@photo.to_jq_upload] }}
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
end
