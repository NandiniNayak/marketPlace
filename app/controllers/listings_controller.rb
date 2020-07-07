class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    def index
        # show all listings
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
    end

    def show
        # show a particular listing
    end

    def create
        # finsih the logic for this later
    end

    def edit

    end

    def update

    end

    def destroy
  
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end
end