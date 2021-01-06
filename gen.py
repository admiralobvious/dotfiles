import argparse
import json
import os

from deepmerge import always_merger
from jinja2 import Environment, FileSystemLoader

parser = argparse.ArgumentParser()
parser.add_argument(
    "-d",
    "--data",
    type=str,
    default=None,
    help="Data to use for rendering the template (default %(default)s)",
)
parser.add_argument(
    "-e",
    "--env",
    type=str,
    default="home",
    help="Environment to build for (default %(default)s)",
)
parser.add_argument(
    "-p",
    "--print",
    default=False,
    action="store_true",
    help="Print output (default %(default)s)",
)
parser.add_argument(
    "-s",
    "--save",
    type=str,
    default=None,
    help="Output location (default %(default)s)",
)
parser.add_argument(
    "-t",
    "--template",
    type=str,
    default=None,
    help="Base jinja2 template file (default %(default)s)",
)


class Template:
    def __init__(self, args):
        self.args = args
        self.template_path = self.args.template
        self.template = self._load_template()
        self.data = self._load_data(self.args.data)

    def _load_template(self):
        env = Environment(
            loader=FileSystemLoader(
                os.path.dirname(os.path.realpath(self.template_path))
            ),
            trim_blocks=True,
            lstrip_blocks=True,
        )
        return env.get_template(os.path.basename(self.template_path))

    def _load_data(self, data):
        if isinstance(data, str):
            with open(data, "r") as fh:
                return self._parse_data(json.load(fh))
        elif isinstance(data, dict):
            return self._parse_data(data)
        else:
            raise TypeError("failure")

    def _parse_data(self, data):
        envs = data.get("environments")
        if not envs:
            raise ValueError("Missing required key 'environments'")

        base = envs.get("base")
        env = envs.get(self.args.env, None)
        if env is None:
            raise ValueError("Missing environment key '{}'".format(self.args.env))

        return always_merger.merge(base, env)

    def render(self):
        t = self.template.render(data=self.data)
        if self.args.print:
            print(t)
        if self.args.save:
            with open(self.args.save, "w") as fh:
                fh.write(t)
        return t
