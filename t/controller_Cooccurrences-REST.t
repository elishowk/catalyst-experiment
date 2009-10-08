use strict;
use warnings;
use Test::More tests => 5;
use JSON;
use URI::Escape;
use YAML::Syck;
use HTTP::Request::Common;

BEGIN { use_ok 'Catalyst::Test', 'GSServer' }
BEGIN { use_ok 'GSServer::Controller::Cooccurrences::REST' }

ok( request('/cooccurrences/rest/getentry')->is_success, 'Request should succeed' );

# POST addentry/
my $uri = URI->new( "http://localhost:3000/cooccurrences/rest/addentry/" );
my $content = encode_json({
	ngram1	=> 'alexis',
	ngram2	=> 'le développeur',
	year	=> 2009,
	cooc	=> 0,
});
my $request	= request POST $uri,
	Content_Type => 'application/json',
 	Content      => $content,
;
ok( $request, 'addentry POST request' );
ok( $request->is_success, 'is successful 2xx' );
my $json = from_json( $request->content );
warn Dump $json;
