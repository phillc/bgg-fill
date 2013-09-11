class BggUser
  BGG_ROOT_PATH = "http://www.boardgamegeek.com/xmlapi2"

  include ActiveModel::Model

  attr_accessor :username

  def collection
    HTTParty.get(BGG_ROOT_PATH + '/collection', query: { username: username })
  end
end
