module BookingSync::API
  class Client
    module Destinations
      # List destinations
      #
      # Returns destinations for the account user is authenticated with.
      # @param options [Hash] A customizable set of options.
      # @option options [Array] fields: List of fields to be fetched.
      # @return [Array<BookingSync::API::Resource>] Array of destinations.
      #
      # @example Get the list of destinations for the current account
      #   destinations = @api.destinations
      #   destinations.first.fullname # => {"en":"Europe, World"}
      # @example Get the list of destinations only with name and fullname for smaller response
      #   @api.destinations(fields: [:name, :fullname])
      # @see http://docs.api.bookingsync.com/reference/endpoints/destinations/#list-destinations
      def destinations(options = {}, &block)
        paginate :destinations, options, &block
      end
    end
  end
end
