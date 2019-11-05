<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@uistudentlife">
<meta name="twitter:creator" content="@uistudentlife">
<meta name="twitter:title" content="$Title.ATT">

<meta property="og:site_name" content="$SiteConfig.Title.ATT" />
<meta property="og:type" content="website" />
<meta property="og:title" content="$Title.ATT" />

<% if $Content %>
	<meta property="og:description" content="$Content.Summary(30).ATT" />
	<meta name="twitter:description" content="$Content.Summary(30).ATT">
<% else %>
	<meta property="og:description" content="After Class: UI Culture, Arts, and Entertainment" />
	<meta name="twitter:description" content="After Class: UI Culture, Arts, and Entertainment">
<% end_if %>
<% if $AfterClassLink %>
<meta property="og:url" content="$AfterClassLink.ATT" />
<% else %>
<meta property="og:url" content="$AbsoluteLink.ATT" />
<% end_if %>
<% if $Image.URL %>
<meta name="twitter:image" content="$Image.URL">
<meta property="og:image" content="$Image.URL" />
<meta property="og:image:width" content="$Image.Width" />
<meta property="og:image:height" content="$Image.Height" />
<% else %>
<meta property="og:image" content="{$absoluteBaseURL}_resources/themes/afterclass/dist/images/og-default.png" />
<meta property="og:image:width" content="2755" />
<meta property="og:image:height" content="1442" />
<% end_if %>
<meta name="author" content="Division of Student Life | The University of Iowa">