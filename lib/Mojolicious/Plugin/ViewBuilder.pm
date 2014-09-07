package Mojolicious::Plugin::ViewBuilder;
our $VERSION = "0.01";

use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ( $self, $app, $conf ) = @_;

    $app->helper(
        add_view => sub {
            shift;
            push( @{ $app->{views}->{ +shift() } }, shift );
        }
    );

    $app->helper(
        pluggable_view => sub {
            shift;
            die "No view defined" unless defined $_[0];
            my $output;
            $output .= $app->$_() for ( @{ $app->{views}->{ +shift() } } );
            return $output;
        }
    );

}

1;

__END__

=encoding utf-8

=head1 NAME

Mojolicious::Plugin::ViewBuilder - It's new $module

=head1 SYNOPSIS

    use Mojolicious::Plugin::ViewBuilder;

=head1 DESCRIPTION

Mojolicious::Plugin::ViewBuilder is ...

=head1 LICENSE

Copyright (C) mudler.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

mudler E<lt>mudler@dark-lab.netE<gt>

=cut

