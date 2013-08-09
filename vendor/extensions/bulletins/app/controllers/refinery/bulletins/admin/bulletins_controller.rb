module Refinery
  module Bulletins
    module Admin
      class BulletinsController < ::Refinery::AdminController

        crudify :'refinery/bulletins/bulletin',   :xhr_paging => true

      before_filter :find_all_bulletins
      before_filter :find_page
      before_filter :find_user_id

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bulletin in the line below:
        present(@page)
      end

      def show
        @bulletin = Bulletin.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bulletin in the line below:
        present(@page)
      end

    protected

      def find_all_bulletins
        @bulletins = Bulletin.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bulletins").first
      end

      def find_user_id
      	@user=current_refinery_user.id
      end

      end
    end
  end
end
