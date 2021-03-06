module BookingSync::API
  class Client
    module Rates
      # List rates
      #
      # Returns rates for the rentals of the account user is authenticated with.
      # @param options [Hash] A customizable set of options.
      # @option options [Array] fields: List of fields to be fetched.
      # @return [Array<BookingSync::API::Resource>] Array of rates.
      #
      # @example Get the list of rates for the current account
      #   rates = @api.rates
      #   rates.first.final_nightly_rate # => 700
      # @example Get the list of rates only with final rates
      #   for smaller response
      #   @api.rates(fields: %w(final_nightly_rate final_weekely_rate final_monthly_rate))
      # @see http://docs.api.bookingsync.com/reference/endpoints/rates/#list-rates
      def rates(options = {}, &block)
        paginate :rates, options, &block
      end
    end
  end
end
