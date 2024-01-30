<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item {{ Request::is('admin/dashboard') ? 'active': ''}}">
            <a class="nav-link" href="{{ url('admin/dashboard') }}">
                <i class="mdi mdi-home menu-icon"></i>
                <span class="menu-title">Bảng điều khiển</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ Request::is('admin/orders') ? 'active': ''}}" href="{{ url('admin/orders') }}">
                <i class="mdi mdi-sale menu-icon"></i>
                <span class="menu-title">Đơn hàng</span>
            </a>
        </li>
        <li class="nav-item {{ Request::is('admin/category*') ? 'active': ''}}">
            <a class="nav-link" data-bs-toggle="collapse" href="#category" aria-expanded="{{ Request::is('admin/category*') ? 'true': 'false'}}">
                <i class="mdi mdi-view-list menu-icon"></i>
                <span class="menu-title">Danh mục</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse {{ Request::is('admin/category*') ? 'show': ''}}" id="category">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ Request::is('admin/category/create') ? 'active': ''}}" href="{{ url('admin/category/create') }}">Thêm danh mục</a>
                    </li>
                    <li class="nav-item"> <a class="nav-link {{ Request::is('admin/category') || Request::is('admin/category/*/edit') ? 'active': ''}}" href="{{ url('admin/category') }}">Danh sách danh mục</a></li>
                </ul>
            </div>
        </li>

        <li class="nav-item {{ Request::is('admin/products*') ? 'active': ''}}">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="{{ Request::is('admin/products*') ? 'true': 'false'}}"
                aria-controls="ui-basic">
                <i class="mdi mdi-plus-circle menu-icon"></i>
                <span class="menu-title">Sản phẩm</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse {{ Request::is('admin/products*') ? 'true': 'false'}}" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ Request::is('admin/products/create') ? 'active': ''}}" href="{{ url('admin/products/create') }}">Thêm sản phẩm</a>
                    </li>
                    <li class="nav-item"> <a class="nav-link {{ Request::is('admin/products') || Request::is('admin/products/*/edit') ? 'active': ''}}" href="{{ url('admin/products') }}">Danh sách sản phẩm</a></li>
                </ul>
            </div>
        </li>

        <li class="nav-item {{ Request::is('admin/brands') ? 'active': ''}}">
            <a class="nav-link" href="{{ url('admin/brands') }}">
                <i class="mdi mdi-chart-pie menu-icon"></i>
                <span class="menu-title">Nhãn Hiệu</span>
            </a>
        </li>

        <li class="nav-item {{ Request::is('admin/colors') ? 'active': ''}}">
            <a class="nav-link" href="{{ url('admin/colors') }}">
                <i class="mdi mdi-chart-pie menu-icon"></i>
                <span class="menu-title">Màu sắc</span>
            </a>
        </li>

        <li class="nav-item {{ Request::is('admin/sliders') ? 'active': ''}}">
            <a class="nav-link" href="{{ url('admin/sliders') }}">
                <i class="mdi mdi-view-carousel menu-icon"></i>
                <span class="menu-title">Sliders</span>
            </a>
        </li>

        <li class="nav-item {{ Request::is('admin/settings') ? 'active': ''}}">
            <a class="nav-link" href="{{ url('admin/settings') }}">
                <i class="mdi mdi-settings menu-icon"></i>
                <span class="menu-title">Cài đặt</span>
            </a>
        </li>

        <li class="nav-item {{ Request::is('admin/users*') ? 'active': ''}}">
            <a class="nav-link" data-bs-toggle="collapse" href="#users" aria-expanded="{{ Request::is('admin/users*') ? 'true': 'false'}}"
                aria-controls="users">
                <i class="mdi mdi-account-multiple-plus menu-icon"></i>
                <span class="menu-title">Người dùng</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse {{ Request::is('admin/users*') ? 'true': 'false'}}" id="users">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link {{ Request::is('admin/users/create') ? 'active': ''}}" href="{{ url('admin/users/create') }}">Thêm người dùng</a></li>
                    <li class="nav-item"> <a class="nav-link {{ Request::is('admin/users') || Request::is('admin/users/*/edit') ? 'active': ''}}" href="{{ url('admin/users') }}">Danh sách người dùng</a></li>
                </ul>
            </div>
        </li>
       
    </ul>
</nav>
