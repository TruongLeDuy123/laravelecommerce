@extends('layouts.app')

@section('title', 'My Orders Details')


@section('content')
    <div class="py-3 py-md-5">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="shadow bg-white p-3">
                        <h4 class="text-primary">
                            <i class="fa fa-shopping-cart text-dark"></i> Đơn hàng chi tiết của tôi
                            <a href="{{ url('orders') }}" class="btn btn-danger btn-sm float-end">Quay lại</a>
                        </h4>
                        <hr>

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
                                <h5>Chi tiết khách hàng</h5>
                                <hr>
                                <h6>Họ và tên: {{ $order->fullname }}</h6>
                                <h6>Email: {{ $order->email }}</h6>
                                <h6>SĐT: {{ $order->phone }}</h6>
                                <h6>Địa chỉ: {{ $order->address }}</h6>
                                <h6>Mã Pin: {{ $order->pincode }}</h6>
                            </div>
                        </div>
                        <br />
                        <h5>Sản phẩm đơn hàng</h5>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ảnh</th>
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
                                                        <span>- Color: {{ $orderItem->productColor->color->name }}</span>
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
            </div>
        </div>
    </div>

@endsection
