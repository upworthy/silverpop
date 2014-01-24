module SilverPop
  class Client
    module User

      # ExportList - This interface exports contact data from a database, query, or contact list. Engage exports the results to a CSV file, then adds that file to the FTP account associated with the current session.
      #
      # @param list_id [String] Unique identifier for the database, query, or contact list Engage is exporting.
      # @param export_type [String] Specifies which contacts to export.
      # @param export_format [String] Specifies the format (file type) for the exported data.
      # @param options [Hash] Optional parameters to send
      # @param export_colums [Array] XML node used to request specific custom database columns to export for each contact.
      # @return [Mash] Mashify body from the API call
      # @example Export list 12345 for 1/1/2014 to 1/2/2014
      #   s = SilverPop.new({access_token: "abc123", url: "https://api1.silverpop.com"})
      #   s.export_list('12345', 'ALL', 'CSV", {DATE_START: "1/1/2014", DATE_END:"1/2/2014"})
      def export_list(list_id, export_type, export_format, options={}, export_columns=[])
        builder = Builder::XmlMarkup.new
        xml = builder.Envelope {
          builder.Body {
            builder.ExportList {
              builder.LIST_ID list_id
              builder.EXPORT_TYPE export_type
              builder.EXPORT_FORMAT export_format
              unless options.empty?
                options.each do |o|
                    builder.tag! o[0], o[1]
                end
              end
              unless export_columns.empty?
                builder.EXPORT_COLUMNS {
                  export_columns.each do |e|
                    builder.COLUMN e
                  end
                }
              end
              }
            }
          }
        post(xml)
      end

    end
  end
end


