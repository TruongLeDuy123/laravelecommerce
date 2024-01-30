@extends('layouts.admin')

@section('title', 'My Orders Details')

@section('content')
    <div class="row">
        <div class="col-md-12">
            @if (session('message'))
                <div class="alert alert-success mb-3">{{ session('message') }}</div>
            @endif
                
            <div class="card">
                <div class="card-header">
                    <h3>Đơn hàng chi tiết của tôi
                        <a href="{{ url('admin/orders') }}" class="btn btn-danger btn-sm float-end mx-1">
                            <span class="mdi mdi-arrow-left-bold" style="float: left; margin-right: 4px"></span> Quay lại
                        </a>
                        <a href="{{ url('admin/invoice/' . $order->id . '/generate') }}"
                            class="btn btn-primary btn-sm float-end mx-1">
                            <span class="mdi mdi-cloud-download" style="float: left; margin-right: 4px"></span> Tải hóa đơn
                        </a>
                        <a href="{{ url('admin/invoice/' . $order->id) }}" target="_blank"
                            class="btn btn-warning btn-sm float-end mx-1">
                            <span class="mdi mdi-eye-outline" style="float: left; margin-right: 4px"></span> Xem hóa đơn
                        </a>
                        <a href="{{ url('admin/invoice/' . $order->id . '/mail') }}" class="btn btn-info btn-sm float-end mx-1">
                            <span class="mdi mdi-eye" style="float: left; margin-right: 4px"></span> Gửi hóa đơn bằng Mail
                        </a>
                    </h3>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h5>Đơn hàng chi tiết</h5>
                            <hr>
                            <h6>Id: {{ $order->id }}</h6>
                            <h6>Số theo dõi: {{ $order->tracking_no }}</h6>
                            <h6>Ngày đặt hàng: {{ $order->created_at->format('d-m-Y h:i A') }}</h6>
                            <h6>Phương thức thanh toán: {{ $order->payment_mode }}</h6>
                            <h6 class="border p-2 text-success">
                                Trạng thái đặt hàng: <span class="text-uppercase">{{ $order->status_message }}</span>
                            </h6>
                        </div>
                        <div class="col-md-6">
                            <h5>Thông tin chi tiết khách hàng</h5>
                            <hr>
                            <h6>Họ và tên: {{ $order->fullname }}</h6>
                            <h6>Email: {{ $order->email }}</h6>
                            <h6>Điện thoại: {{ $order->phone }}</h6>
                            <h6>Địa chỉ: {{ $order->address }}</h6>
                            <h6>Mã Pin: {{ $order->pincode }}</h6>
                        </div>
                    </div>
                    <br />
                    <h5>Danh sách các món hàng</h5>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Hình ảnh</th>
                                    <th>Sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $totalPrice = 0;
                                @endphp
                                @foreach ($order->orderItems as $orderItem)
                                    <tr>
                                        <td width="10%">{{ $orderItem->id }}</td>
                                        <td width="10%">
                                            @if ($orderItem->product->productImages)
                                                <img src="{{ asset($orderItem->product->productImages[0]->image) }}"
                                                    style="width: 50px; height: 50px" alt="">
                                            @else
                                                <img src="" style="width: 50px; height: 50px" alt="">
                                            @endif
                                        </td>
                                        <td>
                                            {{ $orderItem->product->name }}
                                            @if ($orderItem->productColor)
                                                @if ($orderItem->productColor->color)
                                                    <span>- Màu sắc: {{ $orderItem->productColor->color->name }}</span>
                                                @endif
                                            @endif
                                        </td>
                                        <td width="10%">${{ $orderItem->price }}</td>
                                        <td width="10%">{{ $orderItem->quantity }}</td>
                                        <td width="10%" class="fw-bold">
                                            {{ $orderItem->quantity * $orderItem->price }}</td>
                                        @php
                                            $totalPrice += $orderItem->quantity * $orderItem->price;
                                        @endphp
                                    </tr>
                                @endforeach
                                <tr>
                                    <td colspan="5" class="fw-bold">Tổng cộng: </td>
                                    <td colspan="1" class="fw-bold">${{ $totalPrice }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="card border mt-3">
                <div class="card-body">
                    <h4>Cập nhật trạng thái đơn hàng</h4>
                    <hr>
                    <div class="row">
                        <div class="col-md-5">
                            <form action="{{ url('admin/orders/' . $order->id) }}" method="POST">
                                @csrf
                                @method('PUT')

                                <label>Trạng thái đơn hàng</label>
                                <div class="input-group">
                                    <select name="order_status" class="form-select">
                                        <option value="">Lựa chọn trạng thái đơn hàng</option>
                                        <option value="in progress"
                                            {{ Request::get('status') == 'in progress' ? 'selected' : '' }}>Đang trong tiến trình
                                        </option>
                                        <option value="completed"
                                            {{ Request::get('status') == 'completed' ? 'selected' : '' }}>Đã hoàn thành</option>
                                        <option value="pending"
                                            {{ Request::get('status') == 'pending' ? 'selected' : '' }}>Đang xử lí</option>
                                        <option value="cancelled"
                                            {{ Request::get('status') == 'cancelled' ? 'selected' : '' }}>Đã hủy bỏ
                                        </option>
                                        <option value="out-for-delivery"
                                            {{ Request::get('status') == 'out-for-delivery' ? 'selected' : '' }}>Giao hàng tận nơi</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary text-white">Cập nhật</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-7">
                            <br>
                            <h4 class="mt-3">Trạng thái đơn hàng hiện tại: <span
                                    class="text-uppercase">{{ $order->status_message }}</span></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
