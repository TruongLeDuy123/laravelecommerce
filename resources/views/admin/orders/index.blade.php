@extends('layouts.admin')

@section('title', 'My Orders')


@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Đơn hàng của tôi</h3>
                </div>

                <div class="card-body">
                    <form action="" method="GET">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Lọc theo ngày</label>
                                <input type="date" name="date" value="{{ Request::get('date') ?? date('Y-m-d') }}" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <label>Lọc theo trạng thái</label>
                                <select name="status" class="form-select">
                                    <option value="">Lựa chọn tất cả trạng thái</option>
                                    <option value="in progress" {{ Request::get('status') == 'in progress'  ? 'selected': ''}}>Đang trong tiến trình</option>
                                    <option value="completed" {{ Request::get('status') == 'completed' ? 'selected': '' }}>Đã hoàn thành</option>
                                    <option value="pending" {{ Request::get('status') == 'pending'  ? 'selected': ''}}>Đang chờ</option>
                                    <option value="cancelled" {{ Request::get('status') == 'cancelled'  ? 'selected': ''}}>Đã hủy bỏ</option>
                                    <option value="out-for-delivery" {{ Request::get('status') == 'out-for-delivery' ? 'selected': '' }}>Ra ngoài giao hàng</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <br>
                            <button type="submit" class="btn btn-primary">Filter</button>
                        </div>
                    </form>
                    <hr>

                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Số theo dõi</th>
                                    <th>Tên khách hàng</th>
                                    <th>Phương thức thanh toán</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($orders as $item)
                                    <tr>
                                        <td>{{ $item->id }}</td>
                                        <td>{{ $item->tracking_no }}</td>
                                        <td>{{ $item->fullname }}</td>
                                        <td>{{ $item->payment_mode }}</td>
                                        <td>{{ $item->created_at->format('d-m-Y') }}</td>
                                        <td>{{ $item->status_message }}</td>
                                        <td><a href="{{ url('admin/orders/' . $item->id) }}" class="btn btn-primary btn-sm">Xem chi tiết</a>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7">Không có đơn hàng nào có sẵn</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                        <div>
                            {{ $orders->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
