use utf8;
package RPG::Schema::Result::Skill;

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

__PACKAGE__->table("skills");

__PACKAGE__->add_columns(
    "skill_id" => {
        data_type => "integer", extra => { unsigned => 1 }
    },
    "skill_name" => {
        data_type => "char", size => 32,
    },
    "skill_requirements" => {
        data_type => "char", size => 32,
    },
);

__PACKAGE__->set_primary_key("skill_id");

__PACKAGE__->meta->make_immutable;

1;
