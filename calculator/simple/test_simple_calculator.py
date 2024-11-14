from .simple_calculator import SimpleCalculator

def test_add():
    assert SimpleCalculator.add(1, 2) == 3.0
