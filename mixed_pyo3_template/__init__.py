from .mixed_pyo3_template import sum_as_string


def hello():
    return "2 + 2 = " + sum_as_string(2, 2)


def numpy_version():
    try:
        import numpy as np
        return np.__version__
    except ImportError:
        return None
