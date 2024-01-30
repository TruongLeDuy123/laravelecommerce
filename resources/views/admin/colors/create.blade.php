@extends('layouts.admin')

@section('content')

{{-- <livewire:admin.products.index /> --}}
<div class="row">
    <div class="col-md-12">
        @if (session('message'))
            <div class="alert alert-success">{{ session('message') }}</div>
        @endif

        <div class="card">
            <div class="card-header">
                <h3>Thêm màu
                    <a href="{{ url('admin/colors') }}" class="btn btn-danger btn-sm text-white float-end">Quay lại</a>
                </h3>
            </div>

            <div class="card-body">
                <form action="{{ url('admin/colors/create') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label>Tên màu</label>
                        <input type="text" name="name" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>Mã màu</label>
                        <input type="text" name="code" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>Trạng thái</label><br/>
                        <input type="checkbox" name="status" style="width: 30px; height:30px"/>Checked=Ẩn,UnChecked=Hiện
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Tạo</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection