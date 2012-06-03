use warnings;
use strict;

BEGIN {
	eval { require Filter::Util::Call };
	if($@ ne "") {
		require Test::More;
		Test::More::plan(skip_all => "Filter::Util::Call unavailable");
	}
}

use Devel::Declare ();
use Filter::Util::Call qw(filter_add filter_del);
use Test::More tests => 2;

sub my_quote($) { $_[0] }

my $i = 0;

BEGIN { Devel::Declare->setup_for(__PACKAGE__, { my_quote => { const => sub { } } }); }
BEGIN { filter_add(sub { filter_del(); $_ .= "ok \$i++ == 0;"; return 1; }); }

ok $i++ == 1;

1;
