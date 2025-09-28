import click

@click.command()
def cli():
    click.echo("Вітаю! Це персональний помічник. Оберіть команду або введіть 'help'.")

if __name__ == "__main__":
    cli()
