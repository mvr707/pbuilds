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

use Scope::Upper qw<uid validate_uid UP HERE SU_THREADSAFE>;

my $num;

BEGIN {
 skipall 'This Scope::Upper isn\'t thread safe' unless SU_THREADSAFE;
 plan tests => ($num = 30) * 5 + 1;
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

my $top = uid;

sub cb {
 my $tid  = threads->tid();

 my $here = uid;
 my $up;
 {
  $up = uid HERE;
  is uid(UP), $here, "uid(UP) == \$here in block (in thread $tid)";
 }

 is uid(UP), $top, "uid(UP) == \$top (in thread $tid)";

 usleep rand(1e6);

 ok validate_uid($here), "\$here is valid (in thread $tid)";
 ok !validate_uid($up),  "\$up is no longer valid (in thread $tid)";

 return $here;
}

my %uids;

for my $thread (map threads->create(\&cb), 1 .. $num) {
 my $tid = $thread->tid;
 my $uid = $thread->join;
 ++$uids{$uid};
 ok !validate_uid($uid), "\$here is no longer valid (out of thread $tid)";
}

is scalar(keys %uids), $num, 'all the UIDs were different';
