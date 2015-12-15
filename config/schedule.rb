every 2.minutes do 
	runner "order.get_current_date", output: { :error => 'error.log', :standard => 'cron.log' }
end