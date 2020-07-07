class PagesController < ApplicationController
    def home
        render plain: "home page"
    end

    def not_found
        render plain: "page not found"
        # render "pages/error_template"
    end
end