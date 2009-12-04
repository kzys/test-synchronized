package Test::Synchronized;
use strict;
use warnings;

my $Path = sprintf('lock.%d', getppid());

END {
    unlink($Path);
}

sub import {
    while (-f $Path) {
        sleep(1);
    }

    open(my $file, '>', $Path);
    close($file);
}

1;
