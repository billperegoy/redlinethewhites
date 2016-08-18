class SegmentConnectorsController < ApplicationController
  def destroy
    SegmentConnector.delete(segment_connector_params[:id])
    render json: {}, status: 200
  end

  def create
    SegmentConnector.create(user_id: segment_connector_params[:user_id],
                            trail_segment_id: segment_connector_params[:trail_segment_id]
                           )
    render json: {}, status: 201
  end

  private
  def segment_connector_params
    params.permit(:id, :user_id, :trail_segment_id)
  end
end
