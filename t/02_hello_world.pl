#!/opt/local/bin/perl6

use v6;
use Test;

ok True, 'True is a true value';
nok False, 'False is a false value';
is 'ab'.uc, 'AB', 'successful string comparison';
is_approx 2.sqrt, 1.4142135623, 'Approximate numeric comparison';
dies_ok { die "yes"}, 'exceptions';
eval_dies_ok '1 1', 'two terms in a row are a parse error';