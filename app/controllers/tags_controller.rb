class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render @tags.as_json
  end
end
