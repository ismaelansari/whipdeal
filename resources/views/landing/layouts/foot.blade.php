
<!--script-->
<script type="text/javascript" src="{{asset('public/frontend')}}/js/jquery.min.js"></script>
<script type="text/javascript" src="{{asset('public/frontend')}}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="{{asset('public/frontend')}}/js/custom.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>


<script type="text/javascript">
	var base_url = "{{url('/')}}";
</script>
@if(!empty($data['js']))
	@foreach($data['js'] as $js)		
		<script type="text/javascript" src="{{URL::asset('public/frontend/js')}}/{{$js}}"></script>
	@endforeach
@endif
</body>
</html>