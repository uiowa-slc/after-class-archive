<div class="header__container">
    <div class="container-fluid">
        <div class="row">
            <div class=" col-lg-12 content-container title__container">
                <div class="header-graphic"><a href="{$BaseUrl}" class="d-block"><img class="header-graphic__img" src="$ThemeDir/dist/images/header2.png"></a></div>
            </div>
        </div>
        <header role="banner">
            <!--Navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark">

              <!-- Navbar brand -->
  <%--               <a class="navbar-brand " href="{$BaseUrl}" aria-label="{$SiteConfig.Title}">
                   <img class="brand-image" src="$ThemeDir/dist/images/brand.png"/>
                </a> --%>

              <!-- Collapse button -->
              <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <!-- Collapsible content -->
              <div class="collapse navbar-collapse justify-content-center " id="basicExampleNav">
                <!-- Links -->
                <ul class="navbar-nav">
                    <li class="nav-item mr-4"><a class="nav-link nav-link--large" href="events/interest/7491/">Late Night</a></li>
                    <li class="nav-item mr-4"><a class="nav-link nav-link--large" href="events/show/today/">Today</a></li>
                    <li class="nav-item mr-4"><a class="nav-link nav-link--large" href="events/show/weekend/">Weekend</a></li>
                    <% loop $Menu(1) %>
                        <% if not $First %>
                            <li class="nav-item mr-4 $LinkingMode nav-item<% if $isCurrent || $isSection %> active<% end_if %>"><a class="nav-link nav-link--large" href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
                        <% end_if %>
                    <% end_loop %>
                </ul>
              </div>
              <!-- Collapsible content -->
            </nav>
        </header>
    </div>
</div>
