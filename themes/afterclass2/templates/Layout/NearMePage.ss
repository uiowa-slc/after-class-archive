<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false"></script>
<script type="text/javascript" src="{$ThemeDir}/js//jquery.min.js"></script>

<style>

.event_deets {
	margin: 5px 7px 0px 0px;
	padding: 10px;
	width: 30%; 
	float: left;
}

.event_deets h3 {
	font-size: 1.75em !important; /* event bubble header */
}

.event_deets ul {
	padding-left: 0;
	padding-bottom: 5px;
	border-bottom: solid black 1px;
}

.event_deets li { 
	color: black; 
	font-size: 1.33em;
	margin-right: 5px;
	list-style: none;
}

.event_deets p {
	font-size: 1.15em !important;
}

.event_pic {
	width: 59%; 
	float: left; 
	margin: 15px 0px 0px 5px;
	padding: 10px;
}

.event_pic > img {
	max-width: 100%; 
	height: auto; 
	padding: 2px;
	box-shadow: 2px 5px 15px 5px #222222;
}

.more_events_here {
	clear: both;
	margin: 0;
	padding-left: 10px;
}

.event-card {
	height: 100%;
}

.event-card-content {
	min-height: 1px;
}

.infobox-header {
	margin: 5px 0 15px 0;
	padding: 1px 3px 1px 0 !important;
}
	
.infobox-list {
	list-style:none; 
	color: black; 
	padding-left: 0; 
	margin: 3px 1px;
}

.infobox-list li {
	list-style: none;
	color: black;	
}

.venue_section {
	margin: 5px 0px;
	padding: 3px 5px;
	background-color: rgba(112,128,144,0.10);
}

.venue_section:hover { /*transition*/
	-webkit-transition:background-color: rgba(112,128,144,0.25);
	-moz-transition:background-color: rgba(112,128,144,0.25);
    -o-transition:background-color: rgba(112,128,144,0.25);
    transition:background-color: rgba(112,128,144,0.25);
    cursor: hand;
}

.canceled {
	color: #FF0000 !important;
}



.map_info {
	list-style:none; 
	display: inline-block; 
	margin: 0 0 3px 0;
}

.map_info_part {
	font-size: 1em; 
	vertical-align: middle;
}

@media only screen and (max-width: 500px) {
	
	.event_bubble {
		max-width: 320px;
		padding-right: 3px;
	}
	
	.event_deets {
		margin: 5px 7px 0px 0px;
		padding: 10px;
		width: 100%; 
		float: left;
	}
	
	.event_deets h3 {
		font-size: 1.75em !important; /* event bubble header */
	}
	
	.event_deets ul {
		padding-left: 0;
		padding-bottom: 5px;
		border-bottom: solid black 1px;
	}
	
	.event_deets li { 
		color: black; 
		font-size: 1.33em;
		margin-right: 5px;
		list-style: none;
	}
	
	.event_deets p {
		font-size: 1.15em !important;
	}
	
	.event_pic {
		display: none;
	}
	
	.event_pic > img {
		max-width: 100%; 
		height: auto; 
		padding: 2px;
		box-shadow: 2px 5px 15px 5px #222222;
	}
	
	.more_events_here {
		clear: both;
		margin: 0;
		padding-left: 10px;
	}
	
	.event-card {
		height: 100%;	
	}
	
	.infobox-header {
		margin: 5px 0 5px 0;
		padding: 1px 3px 1px 0 !important;
	}
	
	.infobox-list {
		list-style: none; 
		color: black; 
		padding-left: 0; 
		margin: 3px 1px;
	}
	
	#mapcanvas {
		height: 300px;
	}
		
}



</style>

<%-- used to contain info about map
<header id="secondary_header">
	<p class='map_info'><span id='mapStart' class='map_info_part'></span>&nbsp;<span id='mapMark' class='map_info_part'></span></p>
</header>
--%>

<div id="single-page-content">
   
$Content
$Form

</div>


<div class='container-fluid' id='venuesWithEvents'>
<% loop Venues %>
	<% if Events %>
		<section class='event-card-list venue row-fluid' id='$ID' data-link='$Link' <% if $Lat && $Lng %> data-lat='$Lat' data-lng='$Lng' <% else %> data-address='$Address' <% end_if %> data-title='$Title.LimitCharacters(20)'>		
			<h2>$Title</h2>	
			<% loop Events.limit(8) %>
			<div data-title='$Title' data-link='$Link' data-image='$Image' data-cancel='$CancelReason' data-cost='$Cost' <% if Sponsors %><% loop Sponsors %> data-sponsor='$Sponsors' <% end_loop %><% end_if %> <% loop UpcomingDatesAndRanges() %> data-startdate='$StartDate.Day(), $StartDate.Month() $StartDate.DayOfMonth()' data-starttime='$StartTime.Nice' <% end_loop %> >
			<% include EventCard %>	
			</div>	
			<% end_loop %>
		</section>
	<% end_if %>
<% end_loop %>	
</div>
				
	