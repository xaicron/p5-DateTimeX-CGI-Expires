use strict;
use warnings;
use Test::More tests => 10;

use DateTimeX::CGI::Expires;


for (qw/now +1s +8m +3h +4d +6M +9y -10m -5y 2009-01-01 /) {
	ok ( DateTimeX::CGI::Expires->new($_) );
}
