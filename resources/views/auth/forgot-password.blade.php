@extends('layouts.app')

@section('content')
    <div class="container vh-100 d-flex justify-content-center align-items-center">
        <div class="row w-100 justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm p-4">
                    <div class="card-header text-center bg-primary text-white fs-4 fw-bold rounded">
                        Forgot Password
                    </div>

                    <div class="card-body">
                        @if (session('success')) {{-- <-- ¡CAMBIADO 'status' a 'success'! --}}
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }} {{-- <-- ¡CAMBIADO 'status' a 'success'! --}}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif

                        <form method="POST" action="{{ route('password.email') }}">
                            @csrf
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input id="email" type="email" 
                                    class="form-control @error('email') is-invalid @enderror" 
                                    name="email" value="{{ old('email') }}" 
                                    placeholder="Enter your email" required autofocus>
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary p-2">
                                    Send Password Reset Link
                                </button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <a href="{{ route('login') }}" class="btn btn-link">
                                Back to Login
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
