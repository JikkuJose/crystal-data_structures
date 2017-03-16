require_relative './link.rb'

module Crystal
  class Response
    def initialize(text:, link:)
      @text = text
      @link = link
    end
  end
end
