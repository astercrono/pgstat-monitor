<!doctype html>
<html class="no-js" lang="en" dir="ltr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="refresh" content="${config.refreshInterval}">

    <title>PG Stat Activity</title>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
</head>
<body>
	<h3 class='header'>PG Stat Activity</h3>
<table>
	<thead>
		<tr>
			<th>Duration</th>
			<th>PID</th>
			<th>User</th>
			<th>Application</th>
			<th>Address</th>
			<th>Start</th>
			<th>Wait</th>
			<th>State</th>
			<th>Query</th>
		</tr>
	</thead>
	<tbody>
		<#list stats as s>
			<#if s.minutes gte config.dangerThreshold>
				<tr class='dangerRow'>
			<#elseif s.minutes gte config.warningThreshold>
				<tr class='warningRow'>
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

<script src="js/vendor/jquery.js"></script>
<script src="js/vendor/what-input.js"></script>
<script src="js/vendor/foundation.js"></script>
<script src="js/app.js"></script>

</body>
</html>
