#!/usr/bin/env perl

use utf8;

use lib ".";

use strict;
use warnings;

use Test::More;

require_ok( 'RPG::Schema' );

my $schema = RPG::Schema->connect();

isa_ok($schema, "RPG::Schema", "connect");

my $resultset = $schema->resultset("Skill");

isa_ok($resultset, "RPG::Schema::ResultSet::Skill", "resultset");

my @all = $resultset->all();

is(scalar(@all), 6, "->all()");
isa_ok($all[0], "RPG::Schema::Result::Skill", "row");

can_ok($all[0], "skill_id");
can_ok($all[0], "skill_name");
can_ok($all[0], "skill_requirements");

for (my $i = 0; $i < scalar(@all); $i++) {
    is($all[$i]->skill_id, $i+1, "skill_id for element $i in array = " . ($i+1));
}

my $find4 = $resultset->find(4);

isa_ok($find4, "RPG::Schema::Result::Skill", "find a single row");
is($find4->skill_id, 4, "find(4) gives skill_id=4");

done_testing();

