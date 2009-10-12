package DateTimeX::CGI::Expires;

use strict;
use warnings;
use 5.008001;
use Carp ();
use CGI::Util ();
use DateTime::Format::HTTP ();
use Exporter 'import';

our $VERSION = '0.01';

our @EXPORT_OK = qw/from_expires/;

my $tz = DateTime::TimeZone->new(name => 'local');

sub new {
	my $class = shift;
	$class = ref $class || $class;
	my $expires = shift;
	my $args = shift || {};
	
	unless (defined $expires and ref $args eq 'HASH') {
		Carp::croak "Usage: $class->new(\$expires, { time_zone => \$tz })";
	}
	
	return DateTime::Format::HTTP->parse_datetime( CGI::Util::expires( $expires ) )->set_time_zone( $args->{time_zone} || $tz );
}

sub from_expires {
	__PACKAGE__->new(@_);
}

1;
__END__

=head1 NAME

DateTimeX::CGI::Expires - Create DateTime Object from (CGI) expires

=head1 SYNOPSIS

  use DateTimeX::CGI::Expires;
  
  my $dt1 = DateTimeX::CGI::Expires->new('now');
  my $dt2 = DateTimeX::CGI::Expires->new('+1M');
  my $dt3 = DateTimeX::CGI::Expires->new('-3h');
  my $dt4 = DateTimeX::CGI::Expires->new('2009-01-01');
  my $dt5 = DateTimeX::CGI::Expires->new('+5m', +{time_zone => 'Asia/Tokyo'});
  
  use DateTimeX::CGI::Expires qw/from_expires/;
  
  my $dt6 = from_expires '+3d', 'America/Chicago';

=head1 DESCRIPTION

DateTimeX::CGI::Expires is Create DateTime Object from (CGI) expires.
and Very simple interface.

=head1 METHODS

=over

=item new($expires, \%options)

create DateTime object from (CGI) expires.
See also CGI::Util::expires

=item from_expires($expires, \%options)

alias of new.
can be export.

=back

=head1 AUTHOR

Yuji Shimada E<lt>xaicron {at} gmail.comE<gt>

=head1 SEE ALSO

L<CGI::Util>
L<DateTime::Format::HTTP>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
