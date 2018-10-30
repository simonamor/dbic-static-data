use utf8;
package RPG::Schema::ResultSet::Skill;
 
use strict;
use warnings;
 
use Moose;
use MooseX::NonMoose;

extends 'DBIx::Class::ResultSet';

my $row = "RPG::Schema::Result::Skill";

my $data = {
    1 => $row->new({ skill_id => 1, skill_name => "Test1", skill_requirements => "Req 1" }),
    2 => $row->new({ skill_id => 2, skill_name => "Test2", skill_requirements => "Req 2" }),
    3 => $row->new({ skill_id => 3, skill_name => "Test3", skill_requirements => "Req 3" }),
    4 => $row->new({ skill_id => 4, skill_name => "Test4", skill_requirements => "Req 4" }),
    5 => $row->new({ skill_id => 5, skill_name => "Test5", skill_requirements => "Req 5" }),
    6 => $row->new({ skill_id => 6, skill_name => "Test6", skill_requirements => "Req 6" }),
};

has _data => (is => 'ro', required => 1 );

sub BUILDARGS {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    $self->{ _data } = $data;
    return $self;
}

sub all {
    my ($self) = @_;
    @{$self->_data}{ sort keys %{$self->_data} }
}

sub find {
    $_[0]->_data->{ $_[1] };
}

1;
