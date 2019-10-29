<div class="page__background">
    <div class="row">
        <div class=" col-lg-12 content-container title__container" role="main">

           <%--  <div class="header-graphic"><img class="header-graphic__img" src="$ThemeDir/dist/images/header2small.png"></div> --%>
            <article>
                <%-- <h1 class="calendar__title">$Title</h1>
                <div class="content calendar__title">$Content</div> --%>
                <%--<% include MagnificExample %> -- %>
                <%-- <% include SlideshowExample %> --%>
                <%-- <% include ContentExample %> --%>
            </article>
            $Form
            $PageComments
        </div>
    </div>

<header role="banner">
    <nav class="navbar navbar-expand-lg">
  <a class="navbar-brand " href="{$BaseUrl}" aria-label="{$SiteConfig.Title}">
      <%-- {$SiteConfig.Title} --%> <img class="brand-image" src="$ThemeDir/dist/images/Brandimage.png"/>
  </a>

  <div class="navbar-nav-scroll">
    <ul class="navbar-nav bd-navbar-nav flex-row">
        <li class="nav-item mr-3"><a class="nav-link" href="events/interest/7491/">Late Night Programs</a></li>
        <li class="nav-item mr-3"><a class="nav-link" href="events/show/today/">Today</a></li>
        <li class="nav-item mr-3"><a class="nav-link" href="events/show/weekend/">Weekend</a></li>
        <% loop $Menu(1) %>
            <li class="nav-item mr-3 $LinkingMode nav-item<% if $isCurrent || $isSection %> active<% end_if %>"><a class="nav-link" href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
        <% end_loop %>
    </ul>
  </div>

    </nav>
</header>
