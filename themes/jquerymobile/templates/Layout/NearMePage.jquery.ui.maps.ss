<script src="{$ThemeDir}/js/jquery.ui.map.min.js"></script>

<script>

$('#mapPage').live('pageshow',function(){

    $('#mapcanvas').gmap({ 'center': new google.maps.LatLng(42.345573,-71.098326),
                        'zoom':14, 'callback':function() {
                            $('#mapcanvas').gmap('addMarker',{'position':new google.maps.LatLng(42.345573,-71.098326)})
                        } });
        
});
</script>

<div id="mapPage">
	<div id="mapcanvas" style="width:100%;height:400px;"></div>
</div>