#!/usr/bin/perl -w
use strict;
use diagnostics;
use warnings;

use GSServer::Schema::Cooccurrences;
#use YAML::Syck;
#use Getopt::Long;

#my $options = GetOptions( 'config=s' => \my $config );

#my $context = LoadFile( $config );
my $db = GSServer::Schema::Cooccurrences->connect(
	"dbi:SQLite:db/cooccurrences.db"
);

$db->stacktrace(1);
$db->deploy( {add_drop_table => 1} );

