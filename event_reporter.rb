require_relative 'lib/CLI'

cli = CLI.new($stdin,$stdout)
cli.search
