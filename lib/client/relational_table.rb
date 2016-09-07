module SilverPop
  class Client
    module RelationalTable
      # InsertUpdateRelationalTable - This interface inserts or updates relational data.
      #
      # @param table_id [String] Required parameter to specify the ID of the Relational Table you are interacting with. Either TABLE_NAME or TABLE_ID is required.
      # @param rows [Array]
      # @return [Mash] Mashify body from the API call
      # @example Insert into table 86767 a row with one column
      #   s = SilverPop.new access_token: 'abc123', url: 'https://api1.silverpop.com'
      #   s.insert_update_relational_table '86767', [{'Record Id' => 'GHbjh73643hsdiy'}]
      def insert_update_relational_table table_id, rows
        builder = Builder::XmlMarkup.new

        xml = builder.Envelope {
          builder.Body {
            builder.InsertUpdateRelationalTable {
              builder.TABLE_ID table_id
              builder.ROWS {
                rows.each do |row|
                  builder.ROW {
                    row.each do |key, value|
                      builder.COLUMN(name: key) {
                        builder.cdata!(value)
                      }
                    end
                  }
                end
              }
            }
          }
        }

        post(xml)
      end
    end

    # ExportTable - This interface supports programmatically exporting Relational Table data from Engage into a CSV file, which Engage uploads to the FTP account or to the Stored Files directory associated with the session.
    #
    # @param table_id [String] Optional parameter to specify the ID of the Relational Table you are exporting. Either TABLE_NAME or TABLE_ID is required.
    # @param export_format [String] Specifies the format (file type) for the exported data, CSV, TAB, PIPE.
    # @param options [Hash] Optional parameters to send
    # @param export_colums [Array] XML node used to request specific custom database columns to export for each contact.
    # @return [Mash] Mashify body from the API call
    # @example Export Table 12345 for 1/1/2014 to 1/2/2014
    #   s = SilverPop.new({access_token: "abc123", url: "https://api1.silverpop.com"})
    #   s.export_table('12345', 'CSV', {DATE_START: "1/1/2014", DATE_END:"1/2/2014"})
    def export_table(table_id, export_format, options={})
      builder = Builder::XmlMarkup.new
      xml = builder.Envelope {
        builder.Body {
          builder.ExportTable {
            builder.TABLE_NAME table_id
            builder.EXPORT_FORMAT export_format
            unless options.empty?
              options.each do |o|
                builder.tag! o[0], o[1]
              end
            end
            }
          }
      }
      post(xml)
    end
  end
end
