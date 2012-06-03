use strict;
use warnings;
use Test::More tests=>12;

use Moose::Util::TypeConstraints;
use MooseX::Types::Structured qw(Dict Tuple slurpy);
use MooseX::Types::Moose qw(Int Str ArrayRef HashRef Object);

my $array_tailed_tuple =
     Tuple[
        Int,
        Str,
        slurpy ArrayRef[Int],
     ];

is($array_tailed_tuple->name, 'MooseX::Types::Structured::Tuple[Int,Str,slurpy ArrayRef[Int]]');

ok !$array_tailed_tuple->check(['ss',1]), 'correct fail';
ok $array_tailed_tuple->check([1,'ss']), 'correct pass';
ok !$array_tailed_tuple->check({}), 'correct fail';
ok $array_tailed_tuple->check([1,'hello',1,2,3,4]), 'correct pass with tail';
ok !$array_tailed_tuple->check([1,'hello',1,2,'bad',4]), 'correct fail with tail';

my $hash_tailed_dict =
    Dict[
      name=>Str,
      age=>Int,
      slurpy HashRef[Int],
    ];

is($hash_tailed_dict->name, 'MooseX::Types::Structured::Dict[name,Str,age,Int,slurpy HashRef[Int]]');

ok !$hash_tailed_dict->check({name=>'john',age=>'napiorkowski'}), 'correct fail';
ok $hash_tailed_dict->check({name=>'Vanessa Li', age=>35}), 'correct pass';
ok !$hash_tailed_dict->check([]), 'correct fail';
ok $hash_tailed_dict->check({name=>'Vanessa Li', age=>35, more1=>1,more2=>2}), 'correct pass with tail';
ok !$hash_tailed_dict->check({name=>'Vanessa Li', age=>35, more1=>1,more2=>"aa"}), 'correct fail with tail';

