package Test::Synchronized::Lock;
use strict;
use warnings;

use base qw(Class::Accessor::Fast);
__PACKAGE__->mk_ro_accessors(qw(id));

sub new {
    my ($class, @args) = @_;

    my $self = $class->SUPER::new(@args);
    return $self;
}

sub _dir {
    my ($self) = @_;
    sprintf('/tmp/test-synchronized-%d.lock', $self->id);
}

sub lock {
    my ($self) = @_;

    while (-e $self->_dir) {
        sleep(1);
    }

    mkdir($self->_dir);
}

sub unlock {
    my ($self) = @_;

    rmdir($self->_dir);
}

1;
