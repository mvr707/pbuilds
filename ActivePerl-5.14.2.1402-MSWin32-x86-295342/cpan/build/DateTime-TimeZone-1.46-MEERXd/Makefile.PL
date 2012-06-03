
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Time zone object base class and factory",
  "AUTHOR" => "Dave Rolsky <autarch\@urth.org>",
  "BUILD_REQUIRES" => {
    "File::Copy" => 0,
    "Storable" => 0,
    "Sys::Hostname" => 0,
    "Test::More" => "0.88",
    "Test::Output" => 0,
    "base" => 0,
    "overload" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "DateTime-TimeZone",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "DateTime::TimeZone",
  "PREREQ_PM" => {
    "Class::Load" => 0,
    "Class::Singleton" => "1.03",
    "Cwd" => 3,
    "File::Basename" => 0,
    "File::Compare" => 0,
    "File::Find" => 0,
    "File::Spec" => 0,
    "List::Util" => 0,
    "Params::Validate" => "0.72",
    "constant" => 0,
    "parent" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.46",
  "test" => {
    "TESTS" => "t/*.t"
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

if ( $^O eq 'MSWin32' ) {
  $WriteMakefileArgs{PREREQ_PM}{'Win32::TieRegistry'} = '0';
}

if ( $^O eq 'hpux' ) {
  $WriteMakefileArgs{PREREQ_PM}{'DateTime::TimeZone::HPUX'} = '0';
}

WriteMakefile(%WriteMakefileArgs);



