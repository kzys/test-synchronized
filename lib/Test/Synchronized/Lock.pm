package Test::Synchronized::Lock;
use strict;
use warnings;

use base qw(Class::Accessor::Fast);
__PACKAGE__->mk_ro_accessors(qw(id));

use File::Spec;

sub new {
    my ($class, @args) = @_;

    my $self = $class->SUPER::new(@args);
    return $self;
}

sub _dir {
    my ($self) = @_;

    File::Spec->catfile(
        File::Spec->tmpdir,
        sprintf('test-synchronized-%d.lock', $self->id),
    );
}

sub lock {
    my ($self) = @_;

    while (1) {
        if (! -d  $self->_dir) {
            return if mkdir($self->_dir);
        }
        sleep(1);
    }
}

sub unlock {
    my ($self) = @_;

    rmdir($self->_dir);
}

sub DESTROY {
    shift->unlock;
}

1;
