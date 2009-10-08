use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'GSServer' }
BEGIN { use_ok 'GSServer::Controller::Cooccurences::REST' }

ok( request('/cooccurences/rest')->is_success, 'Request should succeed' );


