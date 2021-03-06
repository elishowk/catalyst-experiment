package GSServer::Controller::Cooccurrences::REST;

use strict;
use warnings;
use parent 'Catalyst::Controller::REST';

use YAML::Syck;

__PACKAGE__->config(
	'default'	=> 'application/json',
	'map'		=> {
		'application/json' => 'JSON',
		'text/x-json' => 'JSON',
	}
);

sub _inflated_columns {
   my ( $self, $resultset, $array ) = @_;
   return {
      map { $_ => $resultset->$_ } @$array,
   };
}

sub addentry : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub addentry_POST {
	my ( $self, $c ) = @_;
	# TODO verify required fields
	my $params = $c->req->data;
	if ( 	defined $params->{ ngram1 } &&
		defined $params->{ ngram2 } &&
		defined $params->{ year } &&
		defined $params->{ cooc }
	) {
		my $response =
			$c->model('Cooccurrences::Matrix')->update_or_create(
				$params
			);
		$self->status_ok( $c, entity =>
			{ in_storage => $response->in_storage } );
	}
	else {
		$self->status_bad_request( $c, message => 'bad params' );
	}
}

sub getentry : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub getentry_GET {
	my ( $self, $c ) = @_;
	my $response;
	if (	$c->req->params->{ ngram1 } &&  
			$c->req->params->{ ngram2 } &&  
			$c->req->params->{ year }  
	) {
		$response = $c->model('Cooccurrences::Matrix')->find(
			$c->req->params
		);
	} else {
		$self->status_bad_request( $c, message => 'bad params' );
		$c->detach;
	}
	if ( defined $response ) {
		my @columns = $response->result_source->columns;
		my $formated = $self->_inflated_columns( $response, \@columns );
		$self->status_ok( $c, entity => $formated );
		$c->detach;
	}
	else {
		$self->status_no_content( $c );
		$c->detach;
	}
}

sub getmatrix : Local : ActionClass('REST') {
	my ( $self, $c, $version ) = @_;
}

sub getmatrix_GET {
	my ( $self, $c ) = @_;
	my $res = [];
	my $response = $c->model('Cooccurrences::Matrix')->search();
	if ( defined $response ) {
		while ( my $item = $response->next ) {
			my @columns = $item->result_source->columns;
			push @$res, $self->_inflated_columns( $item, \@columns );
		}
	}
	else {
		$self->status_no_content( $c );
		$c->detach;
	}
	$self->status_ok( $c, entity => $res );
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
