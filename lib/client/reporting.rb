module SilverPop
  class Client
    module Reporting

      # GetSentMailingsForOrg - This interface extracts a listing of mailings sent for an organization for a specified date range.
      #
      # @param date_start [String]  Starting Date in the format “mm/dd/yyyy hh:mm:ss”
      # @param date_end [String] Required Ending Date in the format “mm/dd/yyyy hh:mm:ss”
      # @param options [Hash] Optional parameters to send
      # @return [Mash] Mashify body from the API call
      # @example Get sent mailing for organization for 1/1/2014 to 1/2/2014
      #   s = SilverPop.new({access_token: "abc123", url: "https://api1.silverpop.com"})
      #   s.get_sent_mailings_for_org("1/1/2014", "1/2/2014)
      def get_sent_mailings_for_org(date_start, date_end, options={})
        builder = Builder::XmlMarkup.new
        xml = builder.Envelope {
          builder.Body {
            builder.GetSentMailingsForOrg {
              unless options.empty?
                options.each do |o|
                    builder.tag! o[0], o[1]
                end
              end
              builder.DATE_START date_start
              builder.DATE_END date_end
              }
            }
          }
        post(xml)
      end

      # RawRecipientDataExport - Allows exporting unique contact-level events and creates a .zip file containing a single flat file with all metrics
      #
      # @param query_params [Hash] The list of fields to run the query against MAILING_ID, REPORT_ID, etc.
      # @param options [Hash] The various options on how to export the data EXPORT_FORMAT, FILE_ENCODING, etc.
      # @param columns [Array] Optional list of columns to limit the flat file.
      # @return [Mash] Mashify body from the API call
      # @example Export raw data events for mailing id
      #   s = SilverPop.new({access_token: "abc123", url: "https://api1.silverpop.com"})
      #   s.raw_recipient_data_export({MAILING_ID: 1234},{MOVE_TO_FTP: nil})
      def raw_recipient_data_export(query_params={}, options={}, columns=[])
        builder = Builder::XmlMarkup.new
        xml = builder.Envelope {
          builder.Body {
            builder.RawRecipientDataExport {
              unless query_params.empty?
                query_params.each do |q|
                  if q[0] == :MAILING_ID || q[0] == :REPORT_ID
                    builder.MAILING {
                      builder.tag! q[0], q[1]
                    }
                  else
                    builder.tag! q[0], q[1]
                  end
                end
              end
              unless options.empty?
                options.each do |opt|
                  builder.tag! opt[0], opt[1]
                end
              end
              unless columns.empty?
                builder.COLUMNS {
                  columns.each do |column|
                    builder.COLUMN {
                      builder.NAME column
                    }
                  end
                }
              end
              }
            }
          }
        post(xml)
      end

      # GetJobStatus - After initiating a data job, you can monitor the status of the job using this operation.
      #
      # @param job_id [Integer] The Job ID of the data job
      # @return [Mash] Mashify body from the API call
      # @example Get Job Status for JOB_ID 1234
      #   s = SilverPop.new({access_token: "abc123", url: "https://api1.silverpop.com"})
      #   s.get_job_status(1234)
      def get_job_status(job_id)
        builder = Builder::XmlMarkup.new
        xml = builder.Envelope {
          builder.Body {
            builder.GetJobStatus {
              builder.JOB_ID job_id
              }
            }
          }
        post(xml)
      end

    end
  end
end
