package encoding::source;
use strict;
require encoding;
our @ISA = ('encoding');

sub import {
    local *STDIN;
    local *STDOUT;
    my $class = shift;
    $class->SUPER::import(@_);
}

sub unimport {
    local *STDIN;
    local *STDOUT;
    my $class = shift;
    $class->SUPER::unimport(@_);
}

1;
__END__

=head1 NAME

encoding::source - Allows you to write your script in non-ascii or non-utf8

=head1 SYNOPSIS

    use encoding::source "latin-1";

=head1 DESCRIPTION

See L<encoding::split> for the motivation for this module.

See L<encoding> for usage information.

=head1 AUTHOR

Juerd Waalboer <juerd@cpan.org>

=head1 SEE ALSO

L<encoding::split>, L<encoding>
