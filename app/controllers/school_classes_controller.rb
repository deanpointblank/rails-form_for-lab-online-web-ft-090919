class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.new(school_class_params(:room_number, :title))
        @school_class.save
        redirect_to school_class_path(@school_class)
    end

    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
    end

    def update
        @school_class = SchoolClass.find(params[:id])
        @school_class.update(school_class_params(:room_number, :title))
        redirect_to school_class_path(@school_class)
    end

    private
    #having prob with params : address
    def school_class_params(*args)
        params.require(:school_class).permit(*args)
    end

end