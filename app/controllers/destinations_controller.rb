class DestinationsController < ApplicationController

    def show
        @destination = Destination.find(params[:id])
    end

    def new
        @destination = Destination.new
        "Please check text box."
    end

    def create
        @destination = Destination.new(destination_params)

        if @destination.save
            redirect_to destination_path(@destination)
        else
            render :new
        end
    end

    private
        def destination_params
            params.require(:destination).permit(:name, :country)
        end
end