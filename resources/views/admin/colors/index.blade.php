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
                <h3>Colors List
                    <a href="{{ url('admin/colors/create') }}" class="btn btn-primary btn-sm text-white float-end">Add Color</a>
                </h3>
            </div>

            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Color Name</th>
                            <th>Color</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>
                    </thead>     
                    <tbody>
                        @forelse ($colors as $color)
                            <tr>
                                <td>{{ $color->id }}</td>
                                <td>{{ $color->name }}</td>
                                <td>{{ $color->code }}</td>
                                <td>{{ $color->status == '1' ? 'Hidden': 'Visible' }}</td>
                                <td>
                                    <a href="{{ url('admin/colors/'.$color->id.'/edit') }}" class="btn btn-primary btn-sm">Edit</a>
                                    <a href="{{ url('admin/colors/'.$color->id.'/delete') }}" onclick="return confirm('Are you sure you want to delete this data?')" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7">No Colors Available</td>
                            </tr>
                        @endforelse   
                    </tbody>   
                </table>
            </div>
        </div>
    </div>
</div>

@endsection