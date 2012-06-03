#!perl -T

use strict;
use warnings;

sub skipall {
 my ($msg) = @_;
 require Test::More;
 Test::More::plan(skip_all => $msg);
}

use Config qw<%Config>;

BEGIN {
 my $force = $ENV{PERL_SCOPE_UPPER_TEST_THREADS} ? 1 : !1;
 my $t_v   = $force ? '0' : '1.67';
 skipall 'This perl wasn\'t built to support threads'
                                                    unless $Config{useithreads};
 skipall 'perl 5.13.4 required to test thread safety'
                                              unless $force or "$]" >= 5.013004;
 skipall "threads $t_v required to test thread safety"
                                              unless eval "use threads $t_v; 1";
}

use Test::More;

use Scope::Upper qw<uplevel UP SU_THREADSAFE>;

my $num;

BEGIN {
 skipall 'This Scope::Upper isn\'t thread safe' unless SU_THREADSAFE;
 plan tests => 3 + ($num = 30) * 3;
 defined and diag "Using threads $_" for $threads::VERSION;
 if (eval "use Time::HiRes; 1") {
  defined and diag "Using Time::HiRes $_" for $Time::HiRes::VERSION;
  *usleep = \&Time::HiRes::usleep;
 } else {
  diag 'Using fallback usleep';
  *usleep = sub {
   my $s = int($_[0] / 2.5e5);
   sleep $s if $s;
  };
 }
}

sub depth {
 my $depth = 0;
 while (1) {
  my @c = caller($depth);
  last unless @c;
  ++$depth;
 }
 return $depth - 1;
}

is depth(),                           0, 'check top depth';
is sub { depth() }->(),               1, 'check subroutine call depth';
is do { local $@; eval { depth() } }, 1, 'check eval block depth';

our $z;

sub cb {
 my $d   = splice @_, 1, 1;
 my $p   = shift;
 my $tid = pop;
 is depth(), $d - 1, "$p: correct depth inside";
 $tid, @_, $tid + 2
}

sub up1 {
 my $tid  = threads->tid();
 local $z = $tid;
 my $p    = "[$tid] up1";

 usleep rand(1e6);

 my @res = (
  -2,
  sub {
   my @dummy = (
    -1,
    sub {
     my $d = depth();
     my @ret = &uplevel(\&cb => ($p, $d, $tid + 1, $tid) => UP);
     is depth(), $d, "$p: correct depth after uplevel";
     @ret;
    }->(),
    1
   );
  }->(),
  2
 );

 is_deeply \@res, [ -2, -1, $tid .. $tid + 2, 1, 2 ], "$p: returns correctly";
}

$_->join for map threads->create(\&up1), 1 .. $num;
