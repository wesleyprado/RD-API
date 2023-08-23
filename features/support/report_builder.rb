require 'report_builder'
require 'date'
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'reports/report.json'
    config.report_path = 'reports/REPORT'
    config.report_types = [:html]
    #config.report_title = "<>"
    config.voice_commands = true
    config.color = 'green'
    config.additional_info = {DateTime: DateTime.now, Serviço: $service, Ambiente: ENVIRONMENT}
  end
  ReportBuilder.build_report
end