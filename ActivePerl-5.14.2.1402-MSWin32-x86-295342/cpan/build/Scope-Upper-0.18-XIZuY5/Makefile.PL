use 5.006;

use strict;
use warnings;
use ExtUtils::MakeMaker;

use Config;

my $pl   = $Config{perl_patchlevel};
my $desc = $Config{git_describe};
for ($pl, $desc) {
 $_ = undef unless defined and length;
}

my @DEFINES;

print "Checking if this is an official release of perl... ";
my $is_release = ("$]" < 5.011) ? (defined($pl) || defined($desc) ? 0 : 1)
                                : (defined($desc)                 ? 0 : 1);
push @DEFINES, "-DSU_RELEASE=$is_release";
print $is_release  ? "yes\n" : "no\n";

# Threads, Windows and 5.8.x don't seem to be best friends
if ($^O eq 'MSWin32' && "$]" < 5.009) {
 push @DEFINES, '-DSU_MULTIPLICITY=0';
}

@DEFINES = (DEFINE => join ' ', @DEFINES) if @DEFINES;

my $dist = 'Scope-Upper';

(my $name = $dist) =~ s{-}{::}g;

(my $file = $dist) =~ s{-}{/}g;
$file = "lib/$file.pm";

my %PREREQ_PM = (
 'Exporter' => 0,
 'XSLoader' => 0,
 'base'     => 0,
);

my %META = (
 configure_requires => {
  'Config'              => 0,
  'ExtUtils::MakeMaker' => 0,
 },
 build_requires => {
  'ExtUtils::MakeMaker' => 0,
  'Test::More'          => 0,
  %PREREQ_PM,
 },
 dynamic_config => 1,
 resources => {
  bugtracker => "http://rt.cpan.org/NoAuth/ReportBug.html?Queue=$dist",
  homepage   => "http://search.cpan.org/dist/$dist/",
  license    => 'http://dev.perl.org/licenses/',
  repository => "http://git.profvince.com/?p=perl%2Fmodules%2F$dist.git",
 },
);

WriteMakefile(
 NAME             => $name,
 AUTHOR           => 'Vincent Pit <perl@profvince.com>',
 LICENSE          => 'perl',
 VERSION_FROM     => $file,
 ABSTRACT_FROM    => $file,
 PL_FILES         => {},
 @DEFINES,
 PREREQ_PM        => \%PREREQ_PM,
 MIN_PERL_VERSION => 5.006,
 META_MERGE       => \%META,
 dist             => {
  PREOP    => "pod2text -u $file > \$(DISTVNAME)/README",
  COMPRESS => 'gzip -9f', SUFFIX => 'gz'
 },
 clean            => {
  FILES => "$dist-* *.gcov *.gcda *.gcno cover_db Debian_CPANTS.txt"
 },
);

package MY;

sub postamble {
 return <<'POSTAMBLE';
testdeb: all
	PERL_DL_NONLAZY=1 PERLDB_OPTS="NonStop=1" $(FULLPERLRUN) -MTAP::Harness -e 'TAP::Harness->new({verbosity => q{$(VERBOSE)}, lib => [ q{$(INST_LIB)}, q{$(INST_ARCHLIB)} ], switches => [ q{-d} ]})->runtests(@ARGV)' $(TEST_FILES)
POSTAMBLE
}
