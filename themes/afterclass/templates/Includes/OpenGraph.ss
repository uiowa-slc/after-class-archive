<meta property="og:site_name" content="$SiteConfig.Title.ATT" />
<meta property="og:type" content="website" />
<meta property="og:title" content="$Title.ATT" />
<% if $SummaryContent %>
	<meta property="og:description" content="$SummaryContent.Summary(30).ATT" />
<% else_if $Content %>
	<meta property="og:description" content="$Content.Summary(30).ATT" />
<% else %>
	<meta property="og:description" content="After Class: UI Culture, Arts, and Entertainment!" />
<% end_if %>
<% if $AfterClassLink %>
<meta property="og:url" content="$AfterClassLink.ATT" />
<% else %>
<meta property="og:url" content="$AbsoluteLink.ATT" />
<% end_if %>
<% if $Image.URL %>
<meta property="og:image" content="$Image.ThumbURL" />
<meta property="og:image:width" content="480" />
<meta property="og:image:height" content="320" />
<% else %>
<meta property="og:image" content="{$absoluteBaseURL}_resources/themes/afterclass/dist/images/header2.png" />
<meta property="og:image:width" content="4583" />
<meta property="og:image:height" content="1250" />
<% end_if %>
<meta name="author" content="Division of Student Life | The University of Iowa">