"""Example test module demonstrating basic test structure."""

import pytest


def test_hello_world() -> None:
    """A basic test."""
    assert True


@pytest.mark.smoke  # type: ignore[misc]
def test_hello_world_smoke() -> None:
    """A basic smoke test."""
    assert True
