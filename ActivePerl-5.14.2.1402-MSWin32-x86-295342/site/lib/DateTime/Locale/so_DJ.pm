###########################################################################
#
# This file is auto-generated by the Perl DateTime Suite locale
# generator (0.05).  This code generator comes with the
# DateTime::Locale distribution in the tools/ directory, and is called
# generate-from-cldr.
#
# This file as generated from the CLDR XML locale data.  See the
# LICENSE.cldr file included in this distribution for license details.
#
# This file was generated from the source file so_DJ.xml
# The source file version number was 1.51, generated on
# 2009/05/05 23:06:40.
#
# Do not edit this file directly.
#
###########################################################################

package DateTime::Locale::so_DJ;

use strict;
use warnings;
use utf8;

use base 'DateTime::Locale::so';

sub cldr_version { return "1\.7\.1" }

{
    my $first_day_of_week = "6";
    sub first_day_of_week { return $first_day_of_week }
}

{
    my $glibc_date_format = "\%d\.\%m\.\%Y";
    sub glibc_date_format { return $glibc_date_format }
}

{
    my $glibc_date_1_format = "\%a\ \%b\ \%e\ \%r\ \%Z\ \%Y";
    sub glibc_date_1_format { return $glibc_date_1_format }
}

{
    my $glibc_datetime_format = "\%a\ \%d\ \%b\ \%Y\ \%r\ \%Z";
    sub glibc_datetime_format { return $glibc_datetime_format }
}

{
    my $glibc_time_format = "\%l\:\%M\:\%S";
    sub glibc_time_format { return $glibc_time_format }
}

{
    my $glibc_time_12_format = "\%X\ \%p";
    sub glibc_time_12_format { return $glibc_time_12_format }
}

1;

__END__


=pod

=encoding utf8

=head1 NAME

DateTime::Locale::so_DJ

=head1 SYNOPSIS

  use DateTime;

  my $dt = DateTime->now( locale => 'so_DJ' );
  print $dt->month_name();

=head1 DESCRIPTION

This is the DateTime locale package for Somali Djibouti.

=head1 DATA

This locale inherits from the L<DateTime::Locale::so> locale.

It contains the following data.

=head2 Days

=head3 Wide (format)

  Isniin
  Salaaso
  Arbaco
  Khamiis
  Jimco
  Sabti
  Axad

=head3 Abbreviated (format)

  Isn
  Sal
  Arb
  Kha
  Jim
  Sab
  Axa

=head3 Narrow (format)

  I
  S
  A
  K
  J
  S
  A

=head3 Wide (stand-alone)

  Isniin
  Salaaso
  Arbaco
  Khamiis
  Jimco
  Sabti
  Axad

=head3 Abbreviated (stand-alone)

  Isn
  Sal
  Arb
  Kha
  Jim
  Sab
  Axa

=head3 Narrow (stand-alone)

  I
  S
  A
  K
  J
  S
  A

=head2 Months

=head3 Wide (format)

  Bisha Koobaad
  Bisha Labaad
  Bisha Saddexaad
  Bisha Afraad
  Bisha Shanaad
  Bisha Lixaad
  Bisha Todobaad
  Bisha Sideedaad
  Bisha Sagaalaad
  Bisha Tobnaad
  Bisha Kow iyo Tobnaad
  Bisha Laba iyo Tobnaad

=head3 Abbreviated (format)

  Kob
  Lab
  Sad
  Afr
  Sha
  Lix
  Tod
  Sid
  Sag
  Tob
  KIT
  LIT

=head3 Narrow (format)

  K
  L
  S
  A
  S
  L
  T
  S
  S
  T
  K
  L

=head3 Wide (stand-alone)

  Bisha Koobaad
  Bisha Labaad
  Bisha Saddexaad
  Bisha Afraad
  Bisha Shanaad
  Bisha Lixaad
  Bisha Todobaad
  Bisha Sideedaad
  Bisha Sagaalaad
  Bisha Tobnaad
  Bisha Kow iyo Tobnaad
  Bisha Laba iyo Tobnaad

=head3 Abbreviated (stand-alone)

  Kob
  Lab
  Sad
  Afr
  Sha
  Lix
  Tod
  Sid
  Sag
  Tob
  KIT
  LIT

=head3 Narrow (stand-alone)

  K
  L
  S
  A
  S
  L
  T
  S
  S
  T
  K
  L

=head2 Quarters

=head3 Wide (format)

  Q1
  Q2
  Q3
  Q4

=head3 Abbreviated (format)

  Q1
  Q2
  Q3
  Q4

=head3 Narrow (format)

  1
  2
  3
  4

=head3 Wide (stand-alone)

  Q1
  Q2
  Q3
  Q4

=head3 Abbreviated (stand-alone)

  Q1
  Q2
  Q3
  Q4

=head3 Narrow (stand-alone)

  1
  2
  3
  4

=head2 Eras

=head3 Wide

  BCE
  CE

=head3 Abbreviated

  Ciise ka hor
  Ciise ka dib

=head3 Narrow

  Ciise ka hor
  Ciise ka dib

=head2 Date Formats

=head3 Full

   2008-02-05T18:30:30 = Salaaso, Bisha Labaad 05, 2008
   1995-12-22T09:05:02 = Jimco, Bisha Laba iyo Tobnaad 22, 1995
  -0010-09-15T04:44:23 = Sabti, Bisha Sagaalaad 15, -10

=head3 Long

   2008-02-05T18:30:30 = 05 Bisha Labaad 2008
   1995-12-22T09:05:02 = 22 Bisha Laba iyo Tobnaad 1995
  -0010-09-15T04:44:23 = 15 Bisha Sagaalaad -10

=head3 Medium

   2008-02-05T18:30:30 = 05-Lab-2008
   1995-12-22T09:05:02 = 22-LIT-1995
  -0010-09-15T04:44:23 = 15-Sag--10

=head3 Short

   2008-02-05T18:30:30 = 05/02/08
   1995-12-22T09:05:02 = 22/12/95
  -0010-09-15T04:44:23 = 15/09/-10

=head3 Default

   2008-02-05T18:30:30 = 05-Lab-2008
   1995-12-22T09:05:02 = 22-LIT-1995
  -0010-09-15T04:44:23 = 15-Sag--10

=head2 Time Formats

=head3 Full

   2008-02-05T18:30:30 = 6:30:30 gn UTC
   1995-12-22T09:05:02 = 9:05:02 sn UTC
  -0010-09-15T04:44:23 = 4:44:23 sn UTC

=head3 Long

   2008-02-05T18:30:30 = 6:30:30 gn UTC
   1995-12-22T09:05:02 = 9:05:02 sn UTC
  -0010-09-15T04:44:23 = 4:44:23 sn UTC

=head3 Medium

   2008-02-05T18:30:30 = 6:30:30 gn
   1995-12-22T09:05:02 = 9:05:02 sn
  -0010-09-15T04:44:23 = 4:44:23 sn

=head3 Short

   2008-02-05T18:30:30 = 6:30 gn
   1995-12-22T09:05:02 = 9:05 sn
  -0010-09-15T04:44:23 = 4:44 sn

=head3 Default

   2008-02-05T18:30:30 = 6:30:30 gn
   1995-12-22T09:05:02 = 9:05:02 sn
  -0010-09-15T04:44:23 = 4:44:23 sn

=head2 Datetime Formats

=head3 Full

   2008-02-05T18:30:30 = Salaaso, Bisha Labaad 05, 2008 6:30:30 gn UTC
   1995-12-22T09:05:02 = Jimco, Bisha Laba iyo Tobnaad 22, 1995 9:05:02 sn UTC
  -0010-09-15T04:44:23 = Sabti, Bisha Sagaalaad 15, -10 4:44:23 sn UTC

=head3 Long

   2008-02-05T18:30:30 = 05 Bisha Labaad 2008 6:30:30 gn UTC
   1995-12-22T09:05:02 = 22 Bisha Laba iyo Tobnaad 1995 9:05:02 sn UTC
  -0010-09-15T04:44:23 = 15 Bisha Sagaalaad -10 4:44:23 sn UTC

=head3 Medium

   2008-02-05T18:30:30 = 05-Lab-2008 6:30:30 gn
   1995-12-22T09:05:02 = 22-LIT-1995 9:05:02 sn
  -0010-09-15T04:44:23 = 15-Sag--10 4:44:23 sn

=head3 Short

   2008-02-05T18:30:30 = 05/02/08 6:30 gn
   1995-12-22T09:05:02 = 22/12/95 9:05 sn
  -0010-09-15T04:44:23 = 15/09/-10 4:44 sn

=head3 Default

   2008-02-05T18:30:30 = 05-Lab-2008 6:30:30 gn
   1995-12-22T09:05:02 = 22-LIT-1995 9:05:02 sn
  -0010-09-15T04:44:23 = 15-Sag--10 4:44:23 sn

=head2 Available Formats

=head3 d (d)

   2008-02-05T18:30:30 = 5
   1995-12-22T09:05:02 = 22
  -0010-09-15T04:44:23 = 15

=head3 EEEd (d EEE)

   2008-02-05T18:30:30 = 5 Sal
   1995-12-22T09:05:02 = 22 Jim
  -0010-09-15T04:44:23 = 15 Sab

=head3 Hm (H:mm)

   2008-02-05T18:30:30 = 18:30
   1995-12-22T09:05:02 = 9:05
  -0010-09-15T04:44:23 = 4:44

=head3 hm (h:mm a)

   2008-02-05T18:30:30 = 6:30 gn
   1995-12-22T09:05:02 = 9:05 sn
  -0010-09-15T04:44:23 = 4:44 sn

=head3 Hms (H:mm:ss)

   2008-02-05T18:30:30 = 18:30:30
   1995-12-22T09:05:02 = 9:05:02
  -0010-09-15T04:44:23 = 4:44:23

=head3 hms (h:mm:ss a)

   2008-02-05T18:30:30 = 6:30:30 gn
   1995-12-22T09:05:02 = 9:05:02 sn
  -0010-09-15T04:44:23 = 4:44:23 sn

=head3 M (L)

   2008-02-05T18:30:30 = 2
   1995-12-22T09:05:02 = 12
  -0010-09-15T04:44:23 = 9

=head3 Md (M-d)

   2008-02-05T18:30:30 = 2-5
   1995-12-22T09:05:02 = 12-22
  -0010-09-15T04:44:23 = 9-15

=head3 MEd (E, M-d)

   2008-02-05T18:30:30 = Sal, 2-5
   1995-12-22T09:05:02 = Jim, 12-22
  -0010-09-15T04:44:23 = Sab, 9-15

=head3 MMdd (dd/MM)

   2008-02-05T18:30:30 = 05/02
   1995-12-22T09:05:02 = 22/12
  -0010-09-15T04:44:23 = 15/09

=head3 MMM (LLL)

   2008-02-05T18:30:30 = Lab
   1995-12-22T09:05:02 = LIT
  -0010-09-15T04:44:23 = Sag

=head3 MMMd (MMM d)

   2008-02-05T18:30:30 = Lab 5
   1995-12-22T09:05:02 = LIT 22
  -0010-09-15T04:44:23 = Sag 15

=head3 MMMEd (E MMM d)

   2008-02-05T18:30:30 = Sal Lab 5
   1995-12-22T09:05:02 = Jim LIT 22
  -0010-09-15T04:44:23 = Sab Sag 15

=head3 MMMMd (MMMM d)

   2008-02-05T18:30:30 = Bisha Labaad 5
   1995-12-22T09:05:02 = Bisha Laba iyo Tobnaad 22
  -0010-09-15T04:44:23 = Bisha Sagaalaad 15

=head3 MMMMdd (dd MMMM)

   2008-02-05T18:30:30 = 05 Bisha Labaad
   1995-12-22T09:05:02 = 22 Bisha Laba iyo Tobnaad
  -0010-09-15T04:44:23 = 15 Bisha Sagaalaad

=head3 MMMMEd (E MMMM d)

   2008-02-05T18:30:30 = Sal Bisha Labaad 5
   1995-12-22T09:05:02 = Jim Bisha Laba iyo Tobnaad 22
  -0010-09-15T04:44:23 = Sab Bisha Sagaalaad 15

=head3 ms (mm:ss)

   2008-02-05T18:30:30 = 30:30
   1995-12-22T09:05:02 = 05:02
  -0010-09-15T04:44:23 = 44:23

=head3 y (y)

   2008-02-05T18:30:30 = 2008
   1995-12-22T09:05:02 = 1995
  -0010-09-15T04:44:23 = -10

=head3 yM (y-M)

   2008-02-05T18:30:30 = 2008-2
   1995-12-22T09:05:02 = 1995-12
  -0010-09-15T04:44:23 = -10-9

=head3 yMEd (EEE, y-M-d)

   2008-02-05T18:30:30 = Sal, 2008-2-5
   1995-12-22T09:05:02 = Jim, 1995-12-22
  -0010-09-15T04:44:23 = Sab, -10-9-15

=head3 yMMM (y MMM)

   2008-02-05T18:30:30 = 2008 Lab
   1995-12-22T09:05:02 = 1995 LIT
  -0010-09-15T04:44:23 = -10 Sag

=head3 yMMMEd (EEE, y MMM d)

   2008-02-05T18:30:30 = Sal, 2008 Lab 5
   1995-12-22T09:05:02 = Jim, 1995 LIT 22
  -0010-09-15T04:44:23 = Sab, -10 Sag 15

=head3 yMMMM (y MMMM)

   2008-02-05T18:30:30 = 2008 Bisha Labaad
   1995-12-22T09:05:02 = 1995 Bisha Laba iyo Tobnaad
  -0010-09-15T04:44:23 = -10 Bisha Sagaalaad

=head3 yQ (y Q)

   2008-02-05T18:30:30 = 2008 1
   1995-12-22T09:05:02 = 1995 4
  -0010-09-15T04:44:23 = -10 3

=head3 yQQQ (y QQQ)

   2008-02-05T18:30:30 = 2008 Q1
   1995-12-22T09:05:02 = 1995 Q4
  -0010-09-15T04:44:23 = -10 Q3

=head3 yyMM (MM/yy)

   2008-02-05T18:30:30 = 02/08
   1995-12-22T09:05:02 = 12/95
  -0010-09-15T04:44:23 = 09/-10

=head3 yyQ (Q yy)

   2008-02-05T18:30:30 = 1 08
   1995-12-22T09:05:02 = 4 95
  -0010-09-15T04:44:23 = 3 -10

=head3 yyyyMMMM (MMMM y)

   2008-02-05T18:30:30 = Bisha Labaad 2008
   1995-12-22T09:05:02 = Bisha Laba iyo Tobnaad 1995
  -0010-09-15T04:44:23 = Bisha Sagaalaad -10

=head2 Miscellaneous

=head3 Prefers 24 hour time?

No

=head3 Local first day of the week

Sabti


=head1 SUPPORT

See L<DateTime::Locale>.

=head1 AUTHOR

Dave Rolsky <autarch@urth.org>

=head1 COPYRIGHT

Copyright (c) 2008 David Rolsky. All rights reserved. This program is
free software; you can redistribute it and/or modify it under the same
terms as Perl itself.

This module was generated from data provided by the CLDR project, see
the LICENSE.cldr in this distribution for details on the CLDR data's
license.

=cut
