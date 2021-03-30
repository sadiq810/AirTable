<!DOCTYPE html>
<html>
    <head>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        <script>
            var BaseUrl = '{{ url('/') }}';
        </script>
    </head>
    <body class="py-20">
        <div id="app">
            <people-component></people-component>
        </div>
        <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>
