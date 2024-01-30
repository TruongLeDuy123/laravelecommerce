@extends('layouts.app')

@section('title', 'Thank you for Shopping')


@section('content')

    <div class="py-3 pyt-md-4">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    @if (session('message'))
                        <h5 class="alert alert-success">{{ session('message') }}</h5>
                    @endif

                    <div class="p-4 shadow bg-white">
                        <img src="https://media.istockphoto.com/id/1266252971/vector/online-shop-logo-design.jpg?s=612x612&w=0&k=20&c=UtXBlVqaijOagZXPDiEZNlDoBRfE8o7RW8Sb1VUdUeg=" class="w-20" style="height:250px" alt="">

                        <h4>Cảm ơn bạn vì đã mua sắm tại cửa hàng Truong-Duy</h4>
                        <a href="{{ url('collections') }}" class="btn btn-primary">Mua sắm ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection


