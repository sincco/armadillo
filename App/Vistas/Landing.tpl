<incluir archivo="Header">
<incluir archivo="Menu">

<div id="main-container">
            <header class="navbar navbar-default">
                <ul class="nav navbar-nav-custom">
                    <li class="hidden-xs hidden-sm">
                        <a href="javascript:void(0)" id="sidebar-toggle-lg">
                        <i class="fa fa-list-ul fa-fw"></i>
                        </a>
                    </li>
                    <li class="hidden-md hidden-lg">
                        <a href="javascript:void(0)" id="sidebar-toggle-sm">
                        <i class="fa fa-bars fa-fw"></i>
                    </a>
                    </li>
                        <li class="hidden-md hidden-lg">
                        <a href="/">
                        <i class="fa fa-home fa-fw"></i>
                        </a>
                    </li>
                </ul>
                <form action="page_ready_search_results.php" method="post" class="navbar-form-custom" role="search" />
                    <div class="form-group">
                        <input type="text" id="top-search" name="top-search" class="form-control" placeholder="Buscar.." />
                    </div>
                </form>
            </header>
            <div id="page-content" style="min-height: 570px;">
                <div class="content-header content-header-media">
    <div class="header-section">
        <div class="row">
            <div class="col-md-4 col-lg-6">
                <h1>{usuario}</h1>
            </div>
        </div>
    </div>
    <img src="/img/placeholders/headers/dashboard_header.jpg" alt="header image" class="animation-pulseSlow" />
</div>
<div class="row">
    <div class="col-sm-6 col-lg-3">
        <div class="widget">
        <div class="widget-simple">
        <a href="./page_ready_article.php.html" class="widget-icon pull-left themed-background-autumn animation-fadeIn">
        <i class="fa fa-dropbox"></i>
        </a>
        <h3 class="widget-content text-right animation-pullDown">
        <strong>{cursos}</strong> Certificaciones<br />
        <small>aplicadas</small>
        </h3>
        </div>
        </div>
    </div>
    <div class="col-sm-6 col-lg-3">
        <div class="widget">
        <div class="widget-simple">
        <a href="./page_comp_charts.php.html" class="widget-icon pull-left themed-background-spring animation-fadeIn">
        <i class="fa fa-cog"></i>
        </a>
        <h3 class="widget-content text-right animation-pullDown">
        <strong>Conecta</strong><br />
        <small>con nuevos proyectos</small>
        </h3>
        </div>
        </div>
    </div>
</div>

<incluir archivo="Footer">