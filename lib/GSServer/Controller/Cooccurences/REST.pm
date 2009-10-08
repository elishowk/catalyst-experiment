package GSServer::Controller::Cooccurrences::REST;

use strict;
use warnings;
use parent 'Catalyst::Controller::REST';

__PACKAGE__->config(
	'default'	=> 'application/json',
	'map'		=> {
		'application/json'	=>	'JSON',
		'text/x-json'
	},
);


sub add : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub add_POST : Local : ActionClass('REST')  {
	my ( $self, $c ) = @_;
	if ( $c->model('Cooccurrences')->insert( $c->request->data ) ) {
		$self->	status_ok( $c, entity => $response );
	}
	else {
		$self->status_bad_request( $c, message => 'error inserting data' );
	}
}

sub get : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub get_GET : Local : ActionClass('REST')  {
	my ( $self, $c ) = @_;
	my $response = {
		'msg' => 'hello_world',
	};
	$self->status_ok( $c, entity => $response );
}

=head1 NAME

GSServer::Controller::Cooccurrences::REST - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head1 AUTHOR

alexis, alexis.jacomy@gmail.com
elias, elias.showk@iscpif.fr


=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
