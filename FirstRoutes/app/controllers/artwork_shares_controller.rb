class ArtworkSharesController < ApplicationController
  def create
    # puts artwork_share_params
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    if @artwork_share.destroy
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render plain: "artwork_share does not exist", status: :unprocessable_entity
  end

  private

  def artwork_share_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end
