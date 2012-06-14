import csv
from datetime import datetime
import json
import re
import sys


def float_or_none(s):
    return float(s) if s else None

def date_string(s):
    if s is not None:
        datetime.strptime(s, "%Y-%m-%d") # will raise ValueError if not yyyy-mm-dd
    return s


FORMATS = {
    "as_of_date":        date_string, 
    "start_date":        date_string,
    "end_date":          date_string, 
    "cycle_time_days":   float_or_none, 
    "budget":            float_or_none, 
    "inventory_current": float_or_none, 
    "inventory_turns":   float_or_none, 
    "inventory_peak":    float_or_none, 
    "carry_rate":        float_or_none, 
    "carry_peak":        float_or_none, 
    "carry_current":     float_or_none}


def group_row(row, h1):
    grouped = [[None, []]]
    for h1c, c in zip(h1, row):
        h1c, c = h1c or None, c or None
        if h1c is None:
            grouped[-1][1].append(c)
        else:
            grouped.append([h1c, [c]])
    return grouped

def group_headers(row, h1):
    def assert_fields(group_name, group):
        assert group[0] == group_name
        for detail in group[1]:
            assert detail
    grouped = group_row(row, h1)
    assert grouped[0] == [None, ["as_of_date"]]
    assert_fields("dimensions", grouped[1])
    assert_fields("measures", grouped[2])
    return grouped

def row_to_dict(row, h1, grouped_headers):
    def format(name, value):
        return FORMATS[name](value) if name in FORMATS else value
    def formatted_pairs(names, values):
        return [(name, format(name, value))
                for name, value in zip(names, values)]
    def formatted_lists(lists):
        return [(name, [float_or_none(value) for value in values])
                for name, values in lists]
    grouped_data = group_row(row, h1)
    return dict(as_of_date=date_string(grouped_data[0][1][0]),
                identifiers=grouped_data[1][1],
                # measures as individual properties,
                # forecast lists
                **dict(formatted_pairs(grouped_headers[2][1],
                                       grouped_data[2][1]) +
                       formatted_lists(grouped_data[3:])))

def csv2dict(f_in):
    reader = csv.reader(f_in)
    converted_rows = []
    h1, h2 = next(reader), next(reader)
    grouped_headers = group_headers(h2, h1)
    for row in reader:
        converted_rows.append(row_to_dict(row, h1, grouped_headers))
    return dict(headers=grouped_headers, data=converted_rows)


with open(sys.argv[1], 'rU') as f_in:
    data = csv2dict(f_in)
    print json.dumps(data, indent=4)
