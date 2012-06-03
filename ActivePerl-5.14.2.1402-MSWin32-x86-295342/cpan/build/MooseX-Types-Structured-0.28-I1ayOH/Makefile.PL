
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "MooseX::Types::Structured - Structured Type Constraints for Moose",
  "AUTHOR" => "John Napiorkowski <jjnapiork\@cpan.org>, Florian Ragwitz <rafl\@debian.org>, Yuval Kogman <nothingmuch\@woobling.org>, Tomas Doran <bobtfish\@bobtfish.net>, Robert Sedlacek <rs\@474.at>",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "DateTime" => 0,
    "MooseX::Types::DateTime" => 0,
    "MooseX::Types::Moose" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.94",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooseX-Types-Structured",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooseX::Types::Structured",
  "PREREQ_PM" => {
    "Devel::PartialDump" => "0.13",
    "Moose" => "1.08",
    "Moose::Meta::TypeCoercion" => 0,
    "Moose::Meta::TypeConstraint" => 0,
    "Moose::Meta::TypeConstraint::Parameterizable" => 0,
    "Moose::Util::TypeConstraints" => "1.06",
    "MooseX::Types" => "0.22",
    "Scalar::Util" => 0,
    "Sub::Exporter" => "0.982",
    "overload" => 0
  },
  "VERSION" => "0.28",
  "test" => {
    "TESTS" => "t/*.t t/regressions/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



