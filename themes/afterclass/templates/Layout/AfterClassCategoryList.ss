<h1>$Action.uppercase</h1>
<% control Category %>
<div class="category_name">
<a href="$Link">$Title</a>
<% if Linkurl %>
<div class="link_url">
<a href="http://$LinkURL">$LinkURL</a>
</div>
<% end_if %>
</div>
<% end_control %>