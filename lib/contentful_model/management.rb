module ContentfulModel
  # Wrapper for the CMA Client
  class Management < Contentful::Management::Client
    def initialize(options = {})
      options = ContentfulModel.configuration.to_hash.merge!(options)

      if options[:management_api_only]
        options.merge!(options[:management_api_only])
      end

      ::Rails.logger.debug "ContentfulModel::Management#initialize #{options}"

      super(ContentfulModel.configuration.management_token, options)
    end
  end
end
