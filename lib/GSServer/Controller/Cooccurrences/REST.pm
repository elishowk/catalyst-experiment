package GSServer::Controller::Cooccurrences::REST;

use strict;
use warnings;
use parent 'Catalyst::Controller::REST';

use YAML::Syck;

__PACKAGE__->config(
	'default'	=> 'application/json',
	'map'		=> {
		'application/json'	=>	'JSON',
		'text/x-json' => 'JSON',
	}
);


sub addentry : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub addentry_POST : Local : ActionClass('REST')  {
	my ( $self, $c ) = @_;
	my $response;
	if ( $c->req->params ) {
		if ( $c->model('Cooccurrences')->update_or_create( $c->req->params ) ) {
			$self->	status_ok( $c, entity => { msg => 'hello' } );
		}
		else {
			$self->status_bad_request( $c, message => 'error inserting data' );
		}
	}
	else {
		$self->	status_ok( $c, entity => { msg => 'no data received' } );		
	}
}

sub getentry : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub getentry_GET : Local : ActionClass('REST')  {
	my ( $self, $c ) = @_;
	my $response = $c->model('Cooccurrences::Matrix')->all;
	warn Dump $response;
	$self->status_ok( $c, entity => { msg => 'hello world' } );
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
