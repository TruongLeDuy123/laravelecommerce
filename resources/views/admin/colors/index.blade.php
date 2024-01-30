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
                <h3>Danh sách màu sắc
                    <a href="{{ url('admin/colors/create') }}" class="btn btn-primary btn-sm text-white float-end">Thêm màu</a>
                </h3>
            </div>

            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên màu</th>
                            <th>Mã màu</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>

                        </tr>
                    </thead>     
                    <tbody>
                        @forelse ($colors as $color)
                            <tr>
                                <td>{{ $color->id }}</td>
                                <td>{{ $color->name }}</td>
                                <td>{{ $color->code }}</td>
                                <td>{{ $color->status == '1' ? 'Ẩn': 'Hiện' }}</td>
                                <td>
                                    <a href="{{ url('admin/colors/'.$color->id.'/edit') }}" class="btn btn-primary btn-sm">Sửa</a>
                                    <a href="{{ url('admin/colors/'.$color->id.'/delete') }}" onclick="return confirm('Bạn có muốn xóa màu này không?')" class="btn btn-danger btn-sm">Xóa</a>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7">Không có màu nào</td>
                            </tr>
                        @endforelse   
                    </tbody>   
                </table>
            </div>
        </div>
    </div>
</div>

@endsection