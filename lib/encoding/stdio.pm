package encoding::stdio;
use strict;
require encoding;
our @ISA = ('encoding');

sub DEBUG () { 0 }

sub import {
    my $class = shift;
    my ($name, %arg) = @_;
    local ${^ENCODING};
    if ($arg{Filter}) {
        local $INC{"Filter/Util/Call.pm"} = "dummy";
        local *Filter::Util::Call::import = sub { 
            DEBUG && warn "F'U'C->i faked";
        };
        local *encoding::filter_add = sub {
            DEBUG && warn "filter_add faked";
        };
        $class->SUPER::import(@_);
    } else {
        $class->SUPER::import(@_);
    }
}

sub unimport {
    my $class = shift;
    local $INC{"Filter/Util/Call.pm"} = 0;  # pretend it's not there
    local ${^ENCODING};
    $class->SUPER::unimport(@_);
}

1;
__END__

=head1 NAME

encoding::stdio - Provides an easy way to set encoding layers on STDOUT and STDIN

=head1 SYNOPSIS

    use encoding::stdio "utf8";
    use encoding::stdio ":locale";

=head1 DESCRIPTION

See L<encoding::split> for the motivation for this module.

See L<encoding> for usage information.

=head1 AUTHOR

Juerd Waalboer <juerd@cpan.org>

=head1 SEE ALSO

L<encoding::split>, L<encoding>
