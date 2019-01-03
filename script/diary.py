#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2018/11/10 icecory
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of  MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.

import io
import time
import os
import codecs
import argparse
from ruamel.yaml import YAML


class DiaryManage(object):
    @staticmethod
    def get_yaml(author, date, weather, position, device, tags):
        yaml = YAML()
        yaml.indent(mapping=2, sequence=2, offset=2)
        out = io.StringIO()
        out.write("---\n")
        yaml.dump(data=dict(author=author, date=date,
                            weather=weather, position=position,
                            device=device, tags=tags), stream=out)
        out.write("---\n")
        return out.getvalue()

    @staticmethod
    def get_filename(date):
        return time.strftime("%Y-%m-%d", time.strptime(date, "%Y-%m-%dT%H:%M:%SZ")) + ".md"

    @staticmethod
    def post_diary(path, author, position, device, weather, tags, text,
                   date=time.strftime("%Y-%m-%dT%H:%M:%SZ", time.localtime())):
        with codecs.open(os.path.join(path, DiaryManage.get_filename(date=date)), "w", "utf-8") as f:
            f.write(DiaryManage.get_yaml(author=author, date=date, weather=weather,
                                         position=position, device=device, tags=tags))
            f.write("\n")
            f.write(text)


def parse_args():
    parser = argparse.ArgumentParser(prog="Diary", description="Manage your Diary")
    parser.add_argument("--path", help="path to your diary", default=".", dest="path")
    parser.add_argument("--position", help="your position", default="Beijing-ByteDance中航矮楼", dest="position")
    parser.add_argument("--name", help="your name", default="iceCory", dest="name")
    parser.add_argument("--device", help="your device",
                        default="MacBook Pro (13-inch, 2017, Two Thunderbolt 3 ports) macOS", dest="device")
    parser.add_argument("--content", help="diary content", default="\n", dest="content")
    parser.add_argument("--weather", help="weather", default="Sunny", dest="weather")
    parser.add_argument("--tags", help="tags", default=["work"], dest="tags")
    return parser.parse_args()


def main():
    args = parse_args()
    DiaryManage.post_diary(path=args.path, author=args.name, position=args.position, device=args.device,
                           weather=args.weather,
                           tags=args.tags, text=args.content)


if __name__ == '__main__':
    main()
