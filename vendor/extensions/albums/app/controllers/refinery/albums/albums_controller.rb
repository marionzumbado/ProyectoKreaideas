module Refinery
  module Albums
    class AlbumsController < ::ApplicationController

      before_filter :find_all_albums
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @album in the line below:
        present(@page)
      end

      def show
        @album = Album.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @album in the line below:
        present(@page)
      end

    protected

      def find_all_albums
        @albums = Album.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/albums").first
      end

    end
  end
end
