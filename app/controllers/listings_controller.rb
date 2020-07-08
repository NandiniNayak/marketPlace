class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :set_breeds, :set_sexes, only: [:new, :edit]
    def index
        # show all listings
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
        # default rails new renders for new
    end

    def show
        # show a particular listing
    end

    def create
        # gem built into rails for debugging

        # whitelist the data coming from the form: only the one that is allowed can be stored in db
        @listing = Listing.create(listing_params)
        if @listing.errors.any?
            set_breeds
            set_sexes
            # new # this is wrong
            render "new"
        else 
            redirect_to listings_path
        end
        # byebug
        # render plain: "create is working"
        # finsih the logic for this later
    end

    def edit

    end

    def update
        # finish logic for updating the record
        # capture the data coming from the form and store to db
    end

    def destroy

        # finish the logic
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    def listing_params
         params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet)
    end

    def set_breeds
         @breeds = Breed.all
    end

    def set_sexes
        @sexes = Listing.sexes.keys
    end
end