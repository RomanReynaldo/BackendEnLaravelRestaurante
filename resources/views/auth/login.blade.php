@extends('layouts.app') {{-- Asegúrate de que tu layout 'app' exista --}}

@section('content')
    <div class="container vh-100 d-flex justify-content-center align-items-center">
        <div class="row w-100 justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm p-4">
                    <div class="card-header text-center bg-primary text-white fs-4 fw-bold rounded">
                        Iniciar Sesión
                    </div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('status') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        @endif

                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div class="mb-3">
                                <label for="email" class="form-label">Dirección de Email</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror"
                                    name="email" value="{{ old('email') }}" placeholder="Ingresa tu email" required autocomplete="email" autofocus>
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror"
                                    name="password" placeholder="Ingresa tu contraseña" required autocomplete="current-password">
                                @error('password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3 form-check">
                                <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="form-check-label" for="remember">
                                    Recordarme
                                </label>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary p-2">
                                    Iniciar Sesión
                                </button>
                            </div>

                            <div class="text-center mt-3">
                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        ¿Olvidaste tu contraseña?
                                    </a>
                                @endif
                            </div>
                            {{-- Si tienes una ruta de registro, puedes añadirla --}}
                            {{--
                            <div class="text-center mt-2">
                                <a href="{{ route('register') }}" class="btn btn-link">
                                    ¿No tienes cuenta? Regístrate
                                </a>
                            </div>
                            --}}
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection