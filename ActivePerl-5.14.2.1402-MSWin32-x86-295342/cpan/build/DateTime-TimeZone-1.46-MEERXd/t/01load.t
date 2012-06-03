use strict;
use warnings;

use File::Spec;
use Test::More 0.88;

use lib File::Spec->catdir( File::Spec->curdir, 't' );

BEGIN { require 'check_datetime_version.pl' }

use_ok('DateTime::TimeZone');

done_testing();
