module Refinery
  module Categories
    class CategoriesController < ::ApplicationController

      before_filter :find_all_categories
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @category in the line below:
        #present(@page)
      end
      def destroy
        @category.destroy
        rescue ActiveRecord::DeleteRestrictionError => e
        @category.errors.add(:base, e)
      end
      def show
        #@category = Category.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @category in the line below:
        #present(@page)
      end

    protected

      def find_all_categories
        #@categories = Category.order('position ASC')
      end

      def find_page
        #@page = ::Refinery::Page.where(:link_url => "/categories").first
      end

    end
  end
end
