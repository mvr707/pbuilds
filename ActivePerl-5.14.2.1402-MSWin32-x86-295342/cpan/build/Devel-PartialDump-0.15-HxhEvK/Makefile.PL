#!/usr/bin/perl -w

use strict;

use ExtUtils::MakeMaker;

WriteMakefile(
	NAME         => 'Devel::PartialDump',
	VERSION_FROM => 'lib/Devel/PartialDump.pm',
	INSTALLDIRS  => 'site',
	SIGN         => 1,
	PL_FILES     => { },
	PREREQ_PM    => {
		'Test::Warn' => 0.21,
		'Test::use::ok' => 0,
		'Moose' => 0,
		'Scalar::Util' => 0,
		'namespace::clean' => 0.20,
		'Sub::Exporter' => 0,
	},
);

