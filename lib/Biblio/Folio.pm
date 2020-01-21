package Biblio::Folio;

use strict;
use warnings;

use Data::UUID;

my $ug = Data::UUID->new;

sub new {
    my $cls = shift;
    my $self = bless {
        'root' => '/usr/local/folio',
        @_,
    }, $cls;
    $self->init;
    return $self;
}

sub root { @_ > 1 ? $_[0]{'root'} = $_[1] : $_[0]{'root'} }

sub site {
    my ($self, $name) = @_;
    return Biblio::Folio::Site->new($name, 'folio' => $self);
}

sub init {
    my ($self) = @_;
    my $root = $self->root;
}

sub uuid {
    return $ug->create_str;
}

1;
