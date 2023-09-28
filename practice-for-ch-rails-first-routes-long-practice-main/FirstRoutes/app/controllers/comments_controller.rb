class CommentsController < ApplicationController
    def index
        comments = Comment.all
    end

    def comment_params
        params.require(:comment).permit(:id)
    end

    def create

    end

    def destroy

    end
end