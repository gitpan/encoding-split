package encoding::split;
$VERSION = '0.01';
use Carp qw(croak);
croak "Use encoding, encoding::source, or encoding::stdio";
1;
__END__

=head1 NAME

encoding::split - Like encoding, but affecting only STDIO, or only source.

=head1 SYNOPSIS

    use encoding::source "latin-1";
    use encoding::stdio  ":locale";

=head1 DESCRIPTION

The C<encoding> pragma assumes that the development environment and the
environment in which the program will run, use the same character encoding. Typically, they will be different, but unfortunately, it's too late to change things now.

It's not too late to remedy it in another way. C<encoding::split> provides two
alternative pragmas, that function like C<encoding>, but affect only one
aspect.

=head2 Modules

=head3 encoding::source

Only installs the source filter to interpret your source code under a different
character set, while leaving STDOUT and STDIN intact.

=head3 encoding::stdio

Only installs the PerlIO C<:encoding> layers on STDOUT and STDIN, without
installing a source filter.

=head1 RELIABILITY

These modules are a proof of concept. It should work, but may not be compatible
with Perl 5.9's new I<lexical> C<encoding> pragma. 

=head1 AUTHOR

Juerd Waalboer <juerd@cpan.org>

=head1 SEE ALSO

L<encoding>
