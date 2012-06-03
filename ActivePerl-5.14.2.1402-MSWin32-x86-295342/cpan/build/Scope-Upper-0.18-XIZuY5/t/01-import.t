#!perl -T

use strict;
use warnings;

use Test::More tests => 2 * 17;

require Scope::Upper;

my %syms = (
 reap            => '&;$',
 localize        => '$$;$',
 localize_elem   => '$$$;$',
 localize_delete => '$$;$',
 unwind          => undef,
 want_at         => ';$',
 uplevel         => '&@',
 uid             => ';$',
 validate_uid    => '$',
 TOP             => '',
 HERE            => '',
 UP              => ';$',
 SUB             => ';$',
 EVAL            => ';$',
 SCOPE           => ';$',
 CALLER          => ';$',
 SU_THREADSAFE   => '',
);

for (keys %syms) {
 eval { Scope::Upper->import($_) };
 is $@,            '',        "import $_";
 is prototype($_), $syms{$_}, "prototype $_";
}
