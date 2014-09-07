requires 'Mojo::Base';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008_001';
};

on test => sub {
    requires 'Mojolicious::Lite';
    requires 'Test::Mojo';
    requires 'Test::More', '0.98';
};
