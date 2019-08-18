class TopsController < ApplicationController
    def index
      @items = Item.limit(4).order(id: "desc")
    end
end
