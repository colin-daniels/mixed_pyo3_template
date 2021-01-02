from example_pyo3_mixed import hello, sum_as_string, numpy_version


def test_hello():
    assert hello() == "2 + 2 = 4"


def test_two_plus_two():
    assert sum_as_string(2, 2) == "4"


def test_one_plus_one():
    assert sum_as_string(1, 1) == "2"


def test_numpy_import():
    assert numpy_version() is not None
