<!DOCTYPE HTML>
<html>
<head>
    <title>PG Stat Activity</title>
    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
   
    <meta http-equiv="refresh" content="${config.refreshInterval}" />
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="page-header">
		<h3>PG Activity Monitor</h3>
	</div>
	
	<table class="table table-striped">
		<thead>
			<th>Duration</th>
			<th>PID</th>
			<th>User</th>
			<th>Application</th>
			<th>Address</th>
			<th>Start</th>
			<th>Wait</th>
			<th>State</th>
			<th>Query</th>
		</thead>
		<tbody>
		<#list stats as s>
			<#if s.minutes gte config.dangerThreshold>
			<tr class="table-danger">
			<#elseif s.minutes gte config.warningThreshold>
			<tr class="table-warning">
			<#else>
			<tr>
			</#if>
				<td>${s.duration}</td>
				<td>${s.pid}</td>
				<td>${s.user}</td>
				<td>${s.app}</td>
				<td>${s.address}</td>
				<td>${s.start}</td>
				<td>${s.wait}</td>
				<td>${s.state}</td>
				<td>${s.query}</td>
			</tr>
		</#list>
		</tbody>
	</table>
</body>
</html>