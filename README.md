# mixed_pyo3_template
![test-status](https://github.com/colin-daniels/mixed_pyo3_template/workflows/Python%20Tests/badge.svg)

Template repository for a mixed python/rust package using [pyo3](https://github.com/PyO3/pyo3)
and [maturin](https://github.com/PyO3/maturin) with GitHub actions CI.

## Usage
```sh
$ git clone github:colin-daniels/mixed_pyo3_template
$ cd mixed_pyo3_template
# Once cloned, you need to replace the repo name with your own,
# update Cargo.toml, etc.
$ sed -i 's/mixed_pyo3_template/your_repo_name/g' \
    .github/workflows/python-test.yml \
    Cargo.toml                        \
    mixed_pyo3_template/__init__.py   \
    src/lib.rs                        \
    tests/test_lib.py
# and move the python lib folder
$ mv mixed_pyo3_template your_repo_name
```

## Development
```sh
$ pip install maturin pytest
$ maturin develop
# note: maturin will put the built rust lib in the python package dir
$ ls -l mixed_pyo3_template
total 6816
-rwxrwxr-x 1 cc cc 6971320 Jan  1 16:13 mixed_pyo3_template.cpython-38-x86_64-linux-gnu.so
-rw-rw-r-- 1 cc cc     105 Jan  1 15:52 __init__.py
# tests should now be able to be run
$ PYTHONPATH=. pytest
============================= test session starts ==============================
platform linux -- Python 3.8.5, pytest-6.2.1, py-1.10.0, pluggy-0.13.1
rootdir: /home/user/build/mixed_pyo3_template
collected 4 items

tests/test_lib.py ..                                                     [100%]

============================== 4 passed in 0.01s ===============================
```
