from brownie import SimpleStorage, accounts, config


def read_contract():
    #  most recenet deployment is -1
    # 0 is the first instance of the contract
    simple_storage = SimpleStorage[-1]
    print(simple_storage.retrieve())


def main():
    # brownie run scripts/read_value
    # brownie run scripts/read_value --network rinkeby
    read_contract()
