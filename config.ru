require "rack/static"

use Rack::Static,
  :urls => ["/images", "/js", "/css", "/"],
  :root => "site"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('site/index.html', File::RDONLY)
  ]
}
