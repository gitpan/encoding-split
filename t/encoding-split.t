#!/usr/bin/perl
use warnings FATAL => 'all';
use Test::More tests => 1;

eval { require encoding::split; encoding::split->import; };
ok($@ =~ /^Use\s/, "use encoding::split fails as it should");


