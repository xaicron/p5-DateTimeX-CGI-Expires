use strict;
use warnings;
use Test::More tests => 6;
use Test::Exception;

use DateTimeX::CGI::Expires;

dies_ok { DateTimeX::CGI::Expires->new };
dies_ok { DateTimeX::CGI::Expires->new('hoge') };
dies_ok { DateTimeX::CGI::Expires->new('+1M', 'hoge') };
dies_ok { DateTimeX::CGI::Expires->new('+1M', []) };

ok my $dt = DateTimeX::CGI::Expires->new('+1M', { time_zone => 'Asia/Tokyo' });
isa_ok $dt, 'DateTime';
