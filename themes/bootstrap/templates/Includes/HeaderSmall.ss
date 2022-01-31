<div class="header__container header__container--small">
  <div class="">
    <header role="banner">
      <nav class="navbar navbar-main navbar-expand-lg navbar-dark">
        <!-- Navbar brand -->
        <a class="navbar-brand mr-xl-5" href="{$BaseUrl}" aria-label="{$SiteConfig.Title}">
          <img class="brand-image" src="$ThemeDir/dist/images/brand-full.png"/>
        </a>
        <!-- Collapse button -->
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#mainNav"
        aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="mainNav">
          <!-- Links -->
          <ul class="navbar-nav mr-xl-auto">
            <li class="nav-item mr-xl-4 <% if $ClassName == "UiCalendar" && $Action == "index" %>nav-item-active<% end_if %>"><a class="nav-link" href="events/"><i aria-hidden="true" class="fa fa-calendar"></i> Calendar</a></li>
            <li class="nav-item mr-xl-3 <% if $Action == "interest" && $FilterID == 7491 %>nav-item-active<% end_if %>"><a class="nav-link" href="events/interest/7491/"><i aria-hidden="true" class="fa fa-moon"></i> Late Night</a></li>
            <li class="nav-item mr-xl-3 <% if $Action == "show" && $FilterDate == "today" %>nav-item-active<% end_if %>"><a class="nav-link" href="events/show/today/"><i aria-hidden="true" class="fa fa-clock"></i> Today</a></li>
            <li class="nav-item mr-xl-3 <% if $Action == "show" && $FilterDate == "weekend" %>nav-item-active<% end_if %>"><a class="nav-link" href="events/show/weekend/"><i aria-hidden="true" class="fa fa-calendar-week"></i> Weekend</a></li>

            <li class="nav-item <% if $ID == "1864" %>nav-item-active<% end_if %> mr-xl-3 link nav-item">
              <a class="nav-link" href="add" title="Add Event">
                <i aria-hidden="true" class="fa fa-plus-circle"></i>
              Add Event</a>
            </li>

            <li class="nav-item mr-xl-3 link <% if $ID == "56" %>nav-item-active<% end_if %>">
              <a class="nav-link " href="about-after-class/" title="About After Class"> <i class="fas fa-info-circle"></i>
              About</a>
            </li>

          </ul>
        </div>
        <!-- Collapsible content -->
      </nav>
    </header>
  </div>
</div>
