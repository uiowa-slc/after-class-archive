<header role="banner">
    <nav class="navbar navbar-expand-lg">
  <a class="navbar-brand " href="{$BaseUrl}" aria-label="{$SiteConfig.Title}">
      {$SiteConfig.Title}
  </a>

  <div class="navbar-nav-scroll">
    <ul class="navbar-nav bd-navbar-nav flex-row">
        <% loop $Menu(1) %>
            <li class="nav-item mr-lg-3 $LinkingMode nav-item<% if $isCurrent || $isSection %> active<% end_if %>"><a class="nav-link" href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
        <% end_loop %>
    </ul>
  </div>

    </nav>
</header>
