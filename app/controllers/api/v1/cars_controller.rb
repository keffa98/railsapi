
class Api::V1::CarsController < Api::V1::BaseController


    # before_action :set car, only: [:show, :update]
    
    def index
    @cars = policy_scope(Car)
    end

    def create
    @cars = policy_scope(Car)

    @car = Car.new(car_params)

     if @car.save
      #  head(:ok)
        redirect_to @car
     else
        head(:failed) 
    #   render json: @car , status: :failed 
     end

    end  
    
    def destroy

        @cars = policy_scope(Car)
        @car = Car.where( id: params[:id]).first

       if @car.destroy
        
        head(:ok)
        
       else
        
        head(:failed)
       end 

    end

    def show
        @cars = policy_scope(Car)
        @car = Car.find(params[:id])

        redirect_to @car
        # @authorize @car
    end


    def car_params
        params.require(:car).permit(:name, :color, :rate)
      end
end