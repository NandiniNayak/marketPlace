class ListingsController < ApplicationController
    before_action :set_listing, only: [:show]
    before_action :set_user_listing, only: [:edit, :update, :destroy]

    before_action :set_breeds, :set_sexes, only: [:new, :edit]
    before_action :authenticate_user!

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
        # link the logged in user to the listing being created
        # option1
        @listing = current_user.listings.create(listing_params)
    
        # option 2:
        # @listing = Listing.new(listing_params)
        # @listing.user_id = current_user.id
        # @listing.save

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

        if @listing.update(listing_params)
            redirect_to listings_path
        else    
            set_breeds
            set_sexes
            render "new"
        end

    end

    def destroy
        @listing.destroy
        redirect_to listings_path
        # finish the logic
    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

    # authorise only the user who has created the listing to edit or delete it
    def set_user_listing
        # find the listing and check if that listing belongs to the loggedin user
        id = params[:id]
        @listing = current_user.listings.find_by_id(id)
        # option1
        if @listing == nil
            # boot the user out
            redirect_to listings_path
        end
        # # option2:

        # if listing.user_id !=  current_user.id
        #     redirect_to listings_path
        # end

    end

    def listing_params
         params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :city, :state, :date_of_birth, :diet, :picture)
    end

    def set_breeds
         @breeds = Breed.all
    end

    def set_sexes
        @sexes = Listing.sexes.keys
    end
end