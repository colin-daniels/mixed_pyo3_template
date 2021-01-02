# example_pyo3_mixed
![test-status](https://github.com/colin-daniels/example_pyo3_mixed/workflows/Python%20Tests/badge.svg)

Example mixed python/rust package using `pyo3` and `maturin`.

## Development
```sh
$ pip install maturin pytest
$ maturin develop
# note: maturin will put the built rust lib in the python package dir
$ ls -l example_pyo3_mixed
total 6816
-rwxrwxr-x 1 cc cc 6971320 Jan  1 16:13 example_pyo3_mixed.cpython-38-x86_64-linux-gnu.so
-rw-rw-r-- 1 cc cc     105 Jan  1 15:52 __init__.py
# tests should now be able to be run
$ PYTHONPATH=. pytest
============================= test session starts ==============================
platform linux -- Python 3.8.5, pytest-6.2.1, py-1.10.0, pluggy-0.13.1
rootdir: /home/user/build/example_pyo3_mixed
collected 4 items

tests/test_lib.py ..                                                     [100%]

============================== 4 passed in 0.01s ===============================
```
