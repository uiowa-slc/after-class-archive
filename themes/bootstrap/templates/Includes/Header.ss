<div class="header__container">
    <div class="container-fluid">

        <div class="row d-none d-lg-block">
            <div class=" col-lg-12 content-container title__container">
                <div class="header-graphic">
                    <a href="{$BaseUrl}" class="d-block">
                        <img class="header-graphic__img" src="$ThemeDir/dist/images/header2.png" alt="After Class: UI Culture, arts, and entertainment." />
                    </a>
                </div>
            </div>
        </div>
        <header role="banner">
            <!--Navbar-->
            <nav class="navbar navbar-main navbar-expand-lg navbar-dark">
                <a class="navbar-brand d-lg-none" href="{$BaseUrl}" aria-label="{$SiteConfig.Title}">
                    <img class="brand-image" src="$ThemeDir/dist/images/brand-full.png"/>
                </a>
                <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#mainNav"
                aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Collapsible content -->
                <div class="collapse navbar-collapse justify-content-center " id="mainNav">
                    <!-- Links -->
                    <ul class="navbar-nav">
                        <li class="nav-item mr-lg-4"><a class="nav-link nav-link--large" href="events/"><i aria-hidden="true" class="fa fa-calendar"></i> Calendar</a></li>
                        <li class="nav-item mr-lg-3"><a class="nav-link nav-link--large" href="events/interest/7491/"><i aria-hidden="true" class="fa fa-moon"></i> Late Night</a></li>
                        <li class="nav-item mr-lg-3"><a class="nav-link nav-link--large" href="events/show/today/"><i aria-hidden="true" class="fa fa-clock"></i> Today</a></li>
                        <li class="nav-item mr-lg-3"><a class="nav-link nav-link--large" href="events/show/weekend/"><i aria-hidden="true" class="fa fa-calendar-week"></i> Weekend</a></li>

                        <li class="nav-item mr-lg-3 link nav-item">
                            <a class="nav-link nav-link--large" href="add/" title="Add Your Event">
                                <i aria-hidden="true" class="fa fa-plus-circle"></i>
                            Add Your Event</a>
                        </li>
<%--                                           <li class="nav-item mr-lg-3 link nav-item">
                            <a class="nav-link nav-link--large" href="add-social/" title="Promote">
                                <i aria-hidden="true" class="fa fa-plus-circle"></i>
                            Add Your Post</a>
                        </li> --%>
                        <li class="nav-item mr-lg-3 link nav-item">
                            <a class="nav-link nav-link--large" href="about-after-class/" title="About After Class">
                                <i class="fas fa-info-circle"></i> About</a>
                        </li>



                    </ul>
                </div>
                <!-- Collapsible content -->
            </nav>
            <% include Trending %>
        </header>
    </div>
</div>
