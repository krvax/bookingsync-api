module BookingSync::API
  class Client
    module Reviews
      # List reviews
      #
      # Returns reviews for the account user is authenticated with.
      # @param options [Hash] A customizable set of options.
      # @option options [Array] fields: List of fields to be fetched.
      # @return [Array<BookingSync::API::Resource>] Array of reviews.
      #
      # @example Get the list of reviews for the current account
      #   reviews = @api.reviews
      #   reviews.first.name # => "John Smith"
      # @example Get the list of reviews only with name and comment for smaller response
      #   @api.reviews(fields: [:name, :comment])
      # @see http://docs.api.bookingsync.com/reference/endpoints/reviews/#list-reviews
      def reviews(options = {}, &block)
        paginate :reviews, options, &block
      end

      # Create a new review
      #
      # @param booking [BookingSync::API::Resource|Integer] Booking or ID of
      #   the booking for which a review will be created.
      # @param options [Hash] Review's attributes.
      # @return [BookingSync::API::Resource] Newly created review.
      def create_review(booking, options = {})
        post("bookings/#{booking}/reviews", reviews: [options]).pop
      end
    end
  end
end
