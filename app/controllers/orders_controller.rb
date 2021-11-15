class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy buy add_to_order]
  before_action :set_course, only: %i[show edit update destroy add_to_order]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
    @courses = current_user.order.courses
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
     
    @order.courses.find(params[:id]).delete
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order item was successfully removed." }
      format.json { head :no_content }
    end
  end

  def buy
    
    line_item = @order.courses.map do |course|
      @subject = Subject.find(course.subject_id)
      {
        price_data: {
        currency: 'aud',
          product_data: {
            name: "#{course.name} #{@subject.name} by #{course.tutor.full_name}"
          },
          unit_amount: course.price
        },
        quantity: 1
      }
    end

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [line_item],
      mode: 'payment',
      # These placeholder URLs will be replaced in a following step.
      success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_url
    })

    redirect_to session.url
  end 

  def success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    if session
      success_path
    end 
  end 

  def cancel
  end 

  def add_to_order
    @order.courses << @course
    tutor = @course.tutor
    redirect_to course_path(tutor.id), notice: "Course Succefully added to cart"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_user.order
    end
    def set_course
      @course = Course.find(params[:id])
    end 

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:quanity, :refernces)
    end
end
