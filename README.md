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
collected 3 items

tests/test_lib.py ..                                                     [100%]

============================== 3 passed in 0.01s ===============================
```

## Build
```sh
# build the docker image
$ docker build -t maturin .
# build the package/wheels
$ docker run -v $PWD:/app --rm maturin build --release --bindings=pyo3 --manylinux=2010
# the build command will output to target/wheels
$ ls -l target/wheels
total 8044
-rw-r--r-- 1 root root 1646710 Jan  1 16:09 example_pyo3_mixed-0.1.0.tar.gz
-rw-r--r-- 1 root root 1644948 Jan  1 16:09 example_pyo3_mixed-0.1.0-cp36-cp36m-manylinux2010_x86_64.whl
-rw-r--r-- 1 root root 1645299 Jan  1 16:09 example_pyo3_mixed-0.1.0-cp37-cp37m-manylinux2010_x86_64.whl
-rw-r--r-- 1 root root 1644438 Jan  1 16:09 example_pyo3_mixed-0.1.0-cp38-cp38-manylinux2010_x86_64.whl
-rw-r--r-- 1 root root 1645696 Jan  1 16:10 example_pyo3_mixed-0.1.0-cp39-cp39-manylinux2010_x86_64.whl
```
