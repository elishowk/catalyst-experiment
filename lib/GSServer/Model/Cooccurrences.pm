package GSServer::Model::Cooccurrences;

use strict;
use warnings;
use parent 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
	schema_class => 'GSServer::Schema::Cooccurrences',
	connect_info => {
		dsn => "dbi:SQLite:db/cooccurrences.db",
	}
);

=head1 NAME

GSServer::Model::Cooccurrences - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

elishowk,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
