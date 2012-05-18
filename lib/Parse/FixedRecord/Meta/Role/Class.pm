package Parse::FixedRecord::Meta::Role::Class;
use Moose::Role;
use Moose::Util::TypeConstraints;
# ABSTRACT: metaclass trait for FixedRecord parsers

use List::Util 'sum';

subtype 'My::MMA' =>
    as class_type('Moose::Meta::Attribute');

has fields => (
    traits  => ['Array'],
    is      => 'ro',
    isa     => 'ArrayRef[Str|My::MMA]',
    default => sub { [] },
    handles => {
        add_field => 'push',
    },
);

sub total_length {
    my $self = shift;
    return sum map { ref($_) ? $_->width : length($_) } @{ $self->fields };
}

no Moose::Role;
no Moose::Util::TypeConstraints;

=head1 DESCRIPTION

Stores metadata about the parser. 

=head1 METHODS

=head2 total_length

Returns the total length of the string that will be parsed.

=cut

1;
