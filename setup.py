# setup.py
from setuptools import setup
from Cython.Build import cythonize

setup(
    name="AutoCardChecker",
    ext_modules=cythonize("card_checker.pyx", compiler_directives={'language_level' : "3"})
)
