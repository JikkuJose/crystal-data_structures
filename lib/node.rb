require_relative './response.rb'

module Crystal
  class Node
    def initialize(label:, text:, tags:, responses:)
      @text = text
      @tags = tags
      @responses = responses
      @label = label

      @id = (1000000000*rand).round.to_s(16)[0..5]
    end

    def to_h
      {
        id: @id,
        tags: @tags,
        label: @label,
        text: @text,
        responses: @responses.map(&:to_h)
      }
    end
  end
end
