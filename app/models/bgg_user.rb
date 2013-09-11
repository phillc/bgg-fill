class BggUser
  BGG_ROOT_PATH = "http://www.boardgamegeek.com/xmlapi2"

  include ActiveModel::Model

  attr_accessor :username

  def collection
    response = HTTParty.get(BGG_ROOT_PATH + '/collection', query: { username: username })

    Enumerator.new(response["items"]["totalitems"].to_i) do |yielder|
      response["items"]["item"].each do |item|
        yielder << OpenStruct.new(name: item["name"]["__content__"])
      end
    end
  end
end
