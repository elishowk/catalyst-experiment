package GSServer::Schema::Cooccurrences::Matrix;
use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('matrix');

__PACKAGE__->add_columns(
#	id =>
#	{
#		data_type => 'BIGINT',
#		size      => 20,
#		is_nullable => 0,
#		auto_increment => 1,
#	},
	ngram1 =>
	{
		data_type => 'varchar',
		size      => 256,
		is_nullable => 0,
#		default_value => ,
	},
	ngram2 =>
	{
		data_type => 'varchar',
		size      => 256,
		is_nullable => 0,
#		default_value => undef,
	},
	year =>
	{
		data_type => 'integer',
		size      => 4,
		is_nullable => 0,
#		default_value => undef,
	},
	cooc =>
	{
		data_type => 'integer',
		size      => 10,
		is_nullable => 1,
		default_value => undef,
	},
);

__PACKAGE__->set_primary_key(qw/ngram1 ngram2 year/);
1;
