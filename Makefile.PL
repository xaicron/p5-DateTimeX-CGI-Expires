use inc::Module::Install;
name 'DateTimeX-CGI-Expires';
all_from 'lib/DateTimeX/CGI/Expires.pm';

requires 'DateTime::Format::HTTP';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
