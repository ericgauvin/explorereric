class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
  	redirect_to root_path
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  	redirect_to root_path
  end

  # GET /comments/new
  def new
  	redirect_to root_path
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  	redirect_to root_path
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(allowed_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to photo_path(@comment.photo_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
  	redirect_to root_path
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
  	@photo_id = @comment.photo_id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to photo_path(@photo_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.fetch(:comment, {})
    end

    def allowed_params
    	params.permit("comment" => ["content", "photo_id", "user_id"])["comment"] ||= ActionController::Params.new({})
    end
end
