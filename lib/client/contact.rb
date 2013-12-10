require 'builder'

module SilverPop
  class Client
    module Contact

      # Adds one new contact to an existing database.
      #
      # @param fields [Hash] The list of fields to be passed into SilverPop.
      # @param list_id [Integer] The ID of the database which you are adding the contact
      # @param contact_list_id [Array] The id of the contact list.
      # @return [Mash] Mashify body from the API call
      # @example Add a new email to the database and contact list
      #   s = SilverPop::Client.new(access_token)
      #   s.add_recipient({email: "test@example.com", firstname: "Hello"}, 12345, [4567])
      def add_recipient(fields, list_id, contact_list_id, created_from=1, options={})
        builder = Builder::XmlMarkup.new
        xml = builder.Envelope {
          builder.Body {
            builder.AddRecipient {
              builder.LIST_ID list_id
              builder.CREATED_FROM  created_from
              builder.CONTACT_LISTS {
                contact_list_id.each do |id|
                  builder.CONTACT_LIST_ID  id
                end
              }
              unless options.empty?
                options.each do |opt|
                  builder.tag! opt[0], opt[1]
                end
              end
              fields.each do |field|
                builder.COLUMN {
                  builder.NAME field[0].to_s
                  builder.VALUE field[1]
                }
              end
              }
            }
          }
        response = post(xml, options)
      end

    end
  end
end
