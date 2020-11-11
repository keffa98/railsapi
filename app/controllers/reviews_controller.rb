class ReviewsController < ApplicationController


    def new
        @car = Car.find(params[:car_id])
        @review = Review.new

    end
    
    def create

        @review = Review.new(review_params)
        @car = Car.find(params[:car_id])

        @review.car = @car
        @review.save

        
        redirect_to car_path(@car) 
    end

    def review_params
    params.require.(:review).permit(:content)
    end    
end
