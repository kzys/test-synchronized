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

=head1 NAME

Test::Synchronized

=head1 SYNOPSIS

  use Test::More tests => 1;
  use Test::Synchronized;
  
  ...
  
  ok(cant_run_with_other_tests());

=head1 DESCRIPTION

prove's "-j" option is great.

=head1 AUTHOR

KATO Kazuyoshi E<lt>kzys@8-p.infoE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
