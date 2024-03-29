<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Hóa đơn #{{ $order->id }}</title>

    <style>
        html,
        body {
            margin: 10px;
            padding: 10px;
            font-family: sans-serif;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        span,
        label {
            font-family: sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 0px !important;
        }

        table thead th {
            height: 28px;
            text-align: left;
            font-size: 16px;
            font-family: sans-serif;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            font-size: 14px;
        }

        .heading {
            font-size: 24px;
            margin-top: 12px;
            margin-bottom: 12px;
            font-family: sans-serif;
        }

        .small-heading {
            font-size: 18px;
            font-family: sans-serif;
        }

        .total-heading {
            font-size: 18px;
            font-weight: 700;
            font-family: sans-serif;
        }

        .order-details tbody tr td:nth-child(1) {
            width: 20%;
        }

        .order-details tbody tr td:nth-child(3) {
            width: 20%;
        }

        .text-start {
            text-align: left;
        }

        .text-end {
            text-align: right;
        }

        .text-center {
            text-align: center;
        }

        .company-data span {
            margin-bottom: 4px;
            display: inline-block;
            font-family: sans-serif;
            font-size: 14px;
            font-weight: 400;
        }

        .no-border {
            border: 1px solid #fff !important;
        }

        .bg-blue {
            background-color: #414ab1;
            color: #fff;
        }
    </style>
</head>

<body>
    <div class="text-center">
        <h2>Cảm ơn bạn vì đã đặt hàng!</h2>
        <p>Cảm ơn bạn vì đã mua sản phẩm của {{ $appSetting->website_name ?? "Truong Duy" }}.</p>
        <br/>
        Đơn hàng chi tiết được cung cấp bên dưới!
    </div>
    <table class="order-details">
        <thead>
            <tr>
                <th width="50%" colspan="2">
                    <h2 class="text-start">Truong-Duy Ecommerce</h2>
                </th>
                <th width="50%" colspan="2" class="text-end company-data">
                    <span>Hóa đơn Id: #{{ $order->id }}</span> <br>
                    <span>Ngày: {{ date('d / m / Y') }}</span> <br>
                    <span>Mã Zip : 560077</span> <br>
                    <span>Địa chỉ: #555, Main road, shivaji nagar, Bangalore, India</span> <br>
                </th>
            </tr>
            <tr class="bg-blue">
                <th width="50%" colspan="2">Chi tiết đơn hàng</th>
                <th width="50%" colspan="2">Chi tiết khách hàng</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Id:</td>
                <td>{{ $order->id }}</td>

                <td>Họ và tên:</td>
                <td>{{ $order->fullname }}</td>
            </tr>
            <tr>
                <td>Số theo dõi:</td>
                <td>{{ $order->tracking_no }}</td>

                <td>Email:</td>
                <td>{{ $order->email }}</td>
            </tr>
            <tr>
                <td>Ngày đặt hàng:</td>
                <td>{{ $order->created_at->format('d-m-Y h:i A') }}</td>

                <td>SĐT:</td>
                <td>{{ $order->phone }}</td>
            </tr>
            <tr>
                <td>Phương thức thanh toán:</td>
                <td>{{ $order->payment_mode }}</td>

                <td>Địa chỉ:</td>
                <td>{{ $order->address }}</td>
            </tr>
            <tr>
                <td>Trạng thái đơn hàng:</td>
                <td>{{ $order->status }}</td>

                <td>Mã Pin:</td>
                <td>{{ $order->pincode }}</td>
            </tr>
        </tbody>
    </table>

    <table>
        <thead>
            <tr>
                <th class="no-border text-start heading" colspan="5">
                    Sản phẩm đơn hàng
                </th>
            </tr>
            <tr class="bg-blue">
                <th>ID</th>
                <th>Sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
        </thead>
        <tbody>
            <tbody>
                @php
                    $totalPrice = 0;
                @endphp
                @foreach ($order->orderItems as $orderItem)
                    <tr>
                        <td width="10%">{{ $orderItem->id }}</td>
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
                    <td colspan="4" class="total-heading">Tổng cộng - <small>Inc. all vat/tax</small>: </td>
                    <td colspan="1" class="total-heading">${{ $totalPrice }}</td>
                </tr>
            </tbody>
        </tbody>
    </table>

    <br>
    <p class="text-center">
        Cảm ơn bạn vì đã mua hàng tại Truong-Duy Shopping!
    </p>

</body>

</html>
