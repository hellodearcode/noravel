<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<p>Hei {{$name}},</p>
		 <p>Takk for at du blir med p� {{getcong('site_name')}}.</p>
		<p>Du kan bruke detaljene under for � logge inn {{getcong('site_name')}}.</p>
		<p>Dine detaljer {{getcong('site_name')}}</p>
		
		<p>Brukernavn : {{$email}}</p>
		<p>Passord :{{$password}}</p>
		
		<p>Vennligst bekreft epost adressen ved � trykke p� linken under (eller kopier inn i nettleser):</p>
		<p>{!! link_to('auth/confirm/' . $confirmation_code) !!}.<br></p>
	</body>
</html>
 