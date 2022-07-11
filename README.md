# FieldCompare Action

This repository provides a GitHub action around the command-line interface of [`fieldcompare`](https://gitlab.com/dglaeser/fieldcompare)
(or see the [GitHub mirror](https://github.com/dglaeser/fieldcompare). This allows an easy integration of regression tests into your
workflows.

# Usage

Comparing two files in your workflows is as simple as this:

```yml
- name: regression-test
  uses: dglaeser/action-field-compare@142227fc3744d78caf9e05e95465ed9dac05871f
  with:
    result: "file.csv"
    reference: "reference_file.csv"
```

`fieldcompare` also supports comparing all files with matching file names in two given folders. The action automatically determines if the given
arguments for `results` and `reference` are directories and does a folder comparison in that case. Moreover, the following options can be passed:

- `tolerance-options`: a string containing the `fieldcompare` tolerance options. For instance, `-rtol 1e-2 -atol 1e-6` to define the relative
                       and absolute tolerances to be used. You can also set tolerances for specific fields, as e.g. `-rtol pressure:1e-5`.
