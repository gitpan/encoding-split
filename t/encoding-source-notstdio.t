print "1..1\n";
sub layers {
    join "\0", map { defined($_) ? $_ : 'UNDEF' } (
        PerlIO::get_layers(STDIN),
        PerlIO::get_layers(STDOUT),
    );
}

BEGIN {
    $before = layers();
}
use encoding::source 'utf8';
print 'not ' if layers() ne $before;
print "ok 1\n";
#warn "\nBefore: $before\n___Now: ", layers;
