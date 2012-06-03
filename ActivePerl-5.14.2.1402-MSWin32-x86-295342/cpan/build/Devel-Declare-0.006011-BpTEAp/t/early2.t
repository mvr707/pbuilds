use strict;
use warnings;
use Test::More tests => 2;

use Devel::Declare;
eval q[
    BEGIN {
	*class = sub (&) { $_[0]->() };
	Devel::Declare->setup_for(__PACKAGE__, {
	    class => {
		const => sub {
		    my ($kw, $off) = @_;
		    $off += Devel::Declare::toke_move_past_token($off);
		    $off += Devel::Declare::toke_skipspace($off);
		    die unless substr(Devel::Declare::get_linestr(), $off, 1) eq '{';
		    my $l = Devel::Declare::get_linestr();
		    substr $l, $off + 1, 0, 'pass q[injected];' . (';' x 1000);
		    Devel::Declare::set_linestr($l);
		},
	    },
	});
    }
    class {};
];
is $@, "";

1;
