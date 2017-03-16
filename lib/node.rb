require_relative './response.rb'

module Crystal
  class Node
    def initialize(text:, tags:, responses:)
      @text = text
      @tags = tags
      @responses = responses

      @id = (1000000000*rand).round.to_s(16)[0..5]
    end
  end
end
