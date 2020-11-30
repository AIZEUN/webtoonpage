class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]

  # GET /platforms
  # GET /platforms.json
  def index
    @platforms = Platform.all
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show
  end

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/1/edit
  def edit
  end

  # POST /platforms
  # POST /platforms.json
  def create
    @platform = Platform.new(platform_params)
	user_id = @platform.user_id
	event_id = @platform.event_id
	@event_overlap = Platform.where(user_id: user_id, event_id: event_id).size
    respond_to do |format|
      
	  if @event_overlap > 0
		  format.html{redirect_to events_path, notice: '이 이벤트는 이미 신청하였습니다.'}
	  elsif @platform.save
		  format.html { redirect_to @platform, notice: '이벤트 신청이 성공되었습니다.' }
		  format.json { render :show, status: :created, location: @platform }
      else
        format.html { render :new }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to @platform, notice: 'Platform was successfully updated.' }
        format.json { render :show, status: :ok, location: @platform }
      else
        format.html { render :edit }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
  def destroy
    @platform.destroy
    respond_to do |format|
      format.html { redirect_to platforms_url, notice: 'Platform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def platform_params
      params.require(:platform).permit(:user_id, :event_id)
    end
end
