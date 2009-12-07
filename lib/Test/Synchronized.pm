package Test::Synchronized;
use strict;
use warnings;
use Test::Synchronized::Lock;

our $VERSION = '0.01';

my $default_instance = Test::Synchronized::Lock->new({
    id => getppid()
});

END {
    $default_instance->unlock;
}

sub import {
    $default_instance->lock;
}

1;
