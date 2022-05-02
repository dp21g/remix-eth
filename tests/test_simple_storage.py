from brownie import accounts, SimpleStorage

#  Run by calling brownie test
#  Run single test by brownie test -k test_updating_storage
#  Run test with debug by brownie test --pdb


def test_deploy():
    # Arrange
    account = accounts[0]
    # Act
    simple_storage = SimpleStorage.deploy({"from": account})
    starting_value = simple_storage.retrieve()
    expected = 0
    # Assert
    assert starting_value == expected


def test_updating_storage():
    # Arrange
    account = accounts[0]
    expected = 15
    simple_storage = SimpleStorage.deploy({"from": account})
    # Act
    simple_storage.store(expected, {"from": account})
    # Assert
    assert simple_storage.retrieve() == expected
