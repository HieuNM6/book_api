class Api::V1::BooksController < Api::V1Controller
  skip_before_filter :verify_authenticity_token  
  respond_to :json
  def index
    @books = Book.all
    respond_to do |format|
      format.json
    end
  end

  def show
    @book = Book.find_by_id(params[:id])
    if @book.nil?
      render :json => { :errors => "Id not existed" }
    else
      respond_to do |format|
        format.json
      end
    end
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      respond_to do |format|
        format.json
      end
    else
      render :json => { :errors => @book.errors.full_messages }
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.attributes = books_params
    if @book.save
      respond_to do |format|
        format.json
      end
    else
      render :json => { :errors => @book.errors.full_messages }
    end
  end

  def destroy
    @book = Book.find_by_id(params[:id])
    if @book.nil?
      render :json => { :errors => "Id not existed" }
    else
      @book.destroy
      render :json => { :successful => "Successful to remove" }
    end
  end
  private
    def books_params
      params.require(:book).permit!
    end  
end
