package Parse::FixedRecord::Column;
use Moose::Role;
use Moose::Util::TypeConstraints;
# ABSTRACT: trait for FixedRecord columns

has width => (
    is        => 'ro',
    isa       => 'Int',
    );

sub Moose::Meta::Attribute::Custom::Trait::Column::register_implementation { 
    'Parse::FixedRecord::Column' 
};

=head1 DESCRIPTION

Responsible for declaring the C<width> column.

=head3 C<register_implementation>

Declares the trait alias C<Column>.

=cut

1;
