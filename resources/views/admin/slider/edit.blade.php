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
                <h3>Sửa Slider
                    <a href="{{ url('admin/sliders')}}" class="btn btn-danger btn-sm text-white float-end">Quay lại</a>
                </h3>
            </div>

            <div class="card-body">
                <form action="{{ url('admin/sliders/'.$slider->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method("PUT")
                    <div class="mb-3">
                        <label>Chủ đề</label>
                        <input type="text" name="title" value="{{ $slider->title }}" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>Mô tả</label>
                        <textarea name="description" class="form-control" id="" rows="3">{{ $slider->description }}</textarea>
                    </div>
                    <div class="mb-3">
                        <label>Ảnh</label>
                        <input type="file" name="image" class="form-control">
                        <img src="{{ asset("$slider->image") }}" style="width: 50px; height:50px" alt="Slider">
                    </div>
                    <div class="mb-3">
                        <label>Trạng thái</label><br/>
                        <input type="checkbox" name="status" {{ $slider->status == '1' ? 'checked': ''}}  style="width: 30px; height:30px"/>Checked=Ẩn,UnChecked=Hiện
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection