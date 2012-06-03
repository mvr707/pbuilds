#!perl -T

use strict;
use warnings;

use Test::More tests => 4 + 3 * 2;

use Scope::Upper qw<uplevel HERE UP>;

{
 our $x = 1;
 sub {
  local $x = 2;
  sub {
   local $x = 3;
   uplevel { is $x, 3, 'global variables scoping 1' } HERE;
  }->();
 }->();
}

{
 our $x = 4;
 sub {
  local $x = 5;
  sub {
   local $x = 6;
   uplevel { is $x, 6, 'global variables scoping 2' } UP;
  }->();
 }->();
}

sub {
 "abc" =~ /(.)/;
 sub {
  "xyz" =~ /(.)/;
  uplevel { is $1, 'x', 'match variables scoping 1' } HERE;
 }->();
}->();

sub {
 "abc" =~ /(.)/;
 sub {
  "xyz" =~ /(.)/;
  uplevel { is $1, 'x', 'match variables scoping 2' } UP;
 }->();
}->();

SKIP: {
 skip 'No state variables before perl 5.10' => 3 * 2 unless "$]" >= 5.010;

 my $desc = 'state variables';

 {
  local $@;
  eval 'use feature "state"; sub herp { state $id = 123; return ++$id }';
  die $@ if $@;
 }

 sub derp {
  sub {
   &uplevel(\&herp => UP);
  }->();
 }

 for my $run (1 .. 3) {
  local $@;
  my $ret = eval {
   derp()
  };
  is $@,   '',         "$desc: run $run did not croak";
  is $ret, 123 + $run, "$desc: run $run returned the correct value";
 }
}
