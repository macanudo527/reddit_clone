class VotesController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @Vote = Vote.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @vote = current_user.votes.new(link_params)
    respond_to do |format|
      if @vote.save
        format.js   {
          if @vote.vote_value == 1
            @new_value = @vote.link.upvotes
            @id_name = "#upvotes-" + @vote.link.id.to_s
          else
            @new_value = @vote.link.downvotes
            @id_name = "#downvotes-" + @vote.link.id.to_s
          end          

         }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @vote.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:vote).permit(:user_id, :link_id, :vote_value)
    end
end
