module Refinery
  module Subcategories
    module Admin
      class SubcategoriesController < ::Refinery::AdminController

        crudify :'refinery/subcategories/subcategory', :title_attribute => 'name',:xhr_paging => true
        before_filter :find_all_subcategories
        before_filter :find_categories
        before_filter :find_page

        def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subcategory in the line below:

        present(@page)
      end

      def show

        @subcategory = Subcategory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subcategory in the line below:
        present(@page)
      end

        def destroy
          @subcategory.destroy     
          rescue ActiveRecord::DeleteRestrictionError => e  
            @subcategory.errors.add(:base, e)
            flash[:error] = "La subcategoria no se pudo eliminar debido a que esta asociada con un producto"
            render :index
          else
            flash[:notice] = "Borrado correctamente"
            render :index
        end
      

    protected

      def find_all_subcategories
        @subcategories = Subcategory.order('position ASC')
      end
      def find_categories
        @categories = ::Refinery::Categories::Category.all
      end

      def find_page

        @page = ::Refinery::Page.where(:link_url => "/subcategories").first
      end


      end
    end
  end
end
