module Links
  class CreateService


    attr_reader :full_link, :link_entity

    def initialize(params)
      @full_link = params[:full_link].strip
    end

    def call
      attempts = 10
      while attempts > 0 do
        return { status: true, link: @link_entity } if generate_link(attempts)

        attempts -= 1
      end

      return { status: false, errors: @link_entity.errors }
    end

    private

    def generate_link(attempt)
      timestamped_link = [full_link, Time.current.to_s, attempt].join
      token = Digest::SHA256.base64digest(timestamped_link).first(6)

      @link_entity = Link.create(full_link:, token:)
      return @link_entity.persisted?
    end
  end
end
