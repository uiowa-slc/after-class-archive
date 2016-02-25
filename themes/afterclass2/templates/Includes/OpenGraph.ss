<meta property="og:site_name" content="$SiteConfig.Title.ATT" />
<meta property="og:type" content="website" />
<meta property="og:title" content="$Title.ATT" />
<% if $SummaryContent %>
	<meta property="og:description" content="$SummaryContent.Summary(30).ATT" />
<% else_if $Content %>
	<meta property="og:description" content="$Content.Summary(30).ATT" />
<% else %>
	<meta property="og:description" content="After Class: the best source for University of Iowa events &amp; Iowa City events, culture, nightlife, and more!" />
<% end_if %>
<meta property="og:url" content="$AfterClassLink.ATT" />
<% if $Image %>
<meta property="og:image" content="$Image.URL.ATT" />
<meta property="og:image:width" content="$Image.Width.ATT" />
<meta property="og:image:height" content="$Image.Height.ATT" />

<% else %>
<meta property="og:image" content="{$absoluteBaseURL}{$ThemeDir}/images/ogposter.jpg" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<% end_if %>
<meta name="author" content="Division of Student Life | The University of Iowa">