require 'rack'
require 'rack/less'
require 'rack/contrib/try_static'

use Rack::Less,
  :source    => 'public/assets/less',
  :hosted_at => '/assets/css'

use Rack::TryStatic, 
    :root => "public",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}	