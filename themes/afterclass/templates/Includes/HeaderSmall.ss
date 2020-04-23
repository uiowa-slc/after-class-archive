<div class="header__container">
  <div class="container-fluid">
    <header role="banner">
      <nav class="navbar navbar-expand-lg navbar-dark">
        <!-- Navbar brand -->
          <a class="navbar-brand " href="{$BaseUrl}" aria-label="{$SiteConfig.Title}">
             <img class="brand-image" src="$ThemeDir/dist/images/brand-full.png"/>
          </a>

        <!-- Collapse button -->
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#basicExampleNav"
          aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="basicExampleNav">
          <!-- Links -->
          <ul class="navbar-nav mr-auto">
              <li class="nav-item mr-4"><a class="nav-link" href="events/"><i class="fa fa-calendar"></i> Calendar</a></li>
              <li class="nav-item mr-3"><a class="nav-link" href="events/interest/7491/"><i class="fa fa-moon"></i> Late Night</a></li>
              <li class="nav-item mr-3"><a class="nav-link" href="events/show/today/"><i class="fa fa-clock"></i> Today</a></li>
              <li class="nav-item mr-3"><a class="nav-link" href="events/show/weekend/"><i class="fa fa-calendar-week"></i> Weekend</a></li>
              <% loop $Menu(1) %>
                  <% if not $First %>
                      <li class="nav-item mr-3 $LinkingMode nav-item<% if $isCurrent || $isSection %> active<% end_if %>">

                        <a class="nav-link" href="$Link" title="$Title.XML"><% include HeaderNavIconLogic %>$MenuTitle.XML</a>
                      </li>
                  <% end_if %>
              <% end_loop %>
          </ul>
        </div>
        <!-- Collapsible content -->
      </nav>
    </header> 
  </div>
</div>