package GSServer::Schema::Cooccurrences;
use base qw/DBIx::Class::Schema/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->load_classes(qw/Matrix/);
1;
