pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

import "../application/ImplementationProvider.sol";
import "../application/Package.sol";
import { DeprecatedAdminUpgradeabilityProxy as AdminUpgradeabilityProxy } from "../mocks/DeprecatedAdminUpgradeabilityProxy.sol";
import "../ownership/Ownable.sol";

/**
 * @title App
 * @dev Contract for upgradeable applications.
 * It handles the creation and upgrading of proxies.
 */
contract DeprecatedApp is OpenZeppelinUpgradesOwnable {
  /**
   * @dev Emitted when a new proxy is created.
   * @param proxy Address of the created proxy.
   */
  event ProxyCreated(address proxy);

  /**
   * @dev Emitted when a package dependency is changed in the application.
   * @param providerName Name of the package that changed.
   * @param package Address of the package associated to the name.
   * @param version Version of the package in use.
   */
  event PackageChanged(string providerName, address package, uint64[3] version);

  /**
   * @dev Tracks a package in a particular version, used for retrieving implementations
   */
  struct ProviderInfo {
    Package package;
    uint64[3] version;
  }

  /**
   * @dev Maps from dependency name to a tuple of package and version
   */
  mapping(string => ProviderInfo) internal providers;

  /**
   * @dev Constructor function.
   */
  constructor() public { }

  /**
   * @dev Returns the provider for a given package name, or zero if not set.
   * @param packageName Name of the package to be retrieved.
   * @return provider The provider.
   */
  function getProvider(string memory packageName) public view returns (ImplementationProvider provider) {
    ProviderInfo storage info = providers[packageName];
    if (address(info.package) == address(0)) return ImplementationProvider(0);
    return ImplementationProvider(info.package.getContract(info.version));
  }

  /**
   * @dev Returns information on a package given its name.
   * @param packageName Name of the package to be queried.
   * @return A tuple with the package address and pinned version given a package name, or zero if not set
   */
  function getPackage(string memory packageName) public view returns (Package, uint64[3] memory) {
    ProviderInfo storage info = providers[packageName];
    return (info.package, info.version);
  }

  /**
   * @dev Sets a package in a specific version as a dependency for this application.
   * Requires the version to be present in the package.
   * @param packageName Name of the package to set or overwrite.
   * @param package Address of the package to register.
   * @param version Version of the package to use in this application.
   */
  function setPackage(string memory packageName, Package package, uint64[3] memory version) public onlyOwner {
    require(package.hasVersion(version), "The requested version must be registered in the given package");
    providers[packageName] = ProviderInfo(package, version);
    emit PackageChanged(packageName, address(package), version);
  }

  /**
   * @dev Unsets a package given its name.
   * Reverts if the package is not set in the application.
   * @param packageName Name of the package to remove.
   */
  function unsetPackage(string memory packageName) public onlyOwner {
    require(address(providers[packageName].package) != address(0), "Package to unset not found");
    delete providers[packageName];
    emit PackageChanged(packageName, address(0), [uint64(0), uint64(0), uint64(0)]);
  }

  /**
   * @dev Returns the implementation address for a given contract name, provided by the `ImplementationProvider`.
   * @param packageName Name of the package where the contract is contained.
   * @param contractName Name of the contract.
   * @return Address where the contract is implemented.
   */
  function getImplementation(string memory packageName, string memory contractName) public view returns (address) {
    ImplementationProvider provider = getProvider(packageName);
    if (address(provider) == address(0)) return address(0);
    return provider.getImplementation(contractName);
  }

  /**
   * @dev Returns the current implementation of a proxy.
   * This is needed because only the proxy admin can query it.
   * @return The address of the current implementation of the proxy.
   */
  function getProxyImplementation(AdminUpgradeabilityProxy proxy) public returns (address) {
    return proxy.implementation();
  }

  /**
   * @dev Returns the admin of a proxy. Only the admin can query it.
   * @return The address of the current admin of the proxy.
   */
  function getProxyAdmin(AdminUpgradeabilityProxy proxy) public view returns (address) {
    return proxy.admin();
  }

  /**
   * @dev Changes the admin of a proxy.
   * @param proxy Proxy to change admin.
   * @param newAdmin Address to transfer proxy administration to.
   */
  function changeProxyAdmin(AdminUpgradeabilityProxy proxy, address newAdmin) public onlyOwner {
    proxy.changeAdmin(newAdmin);
  }

  /**
   * @dev Creates a new proxy for the given contract and forwards a function call to it.
   * This is useful to initialize the proxied contract.
   * @param packageName Name of the package where the contract is contained.
   * @param contractName Name of the contract.
   * @param data Data to send as msg.data to the corresponding implementation to initialize the proxied contract.
   * It should include the signature and the parameters of the function to be called, as described in
   * https://solidity.readthedocs.io/en/v0.4.24/abi-spec.html#function-selector-and-argument-encoding.
   * This parameter is optional, if no data is given the initialization call to proxied contract will be skipped.
   * @return Address of the new proxy.
   */
   function create(string memory packageName, string memory contractName, bytes memory data) payable public returns (AdminUpgradeabilityProxy) {
    address implementation = getImplementation(packageName, contractName);
     AdminUpgradeabilityProxy proxy = (new AdminUpgradeabilityProxy){value: msg.value}(implementation, data);
     emit ProxyCreated(address(proxy));
     return proxy;
  }

  /**
   * @dev Upgrades a proxy to the newest implementation of a contract.
   * @param proxy Proxy to be upgraded.
   * @param packageName Name of the package where the contract is contained.
   * @param contractName Name of the contract.
   */
  function upgrade(AdminUpgradeabilityProxy proxy, string memory packageName, string memory contractName) public onlyOwner {
    address implementation = getImplementation(packageName, contractName);
    proxy.upgradeTo(implementation);
  }

  /**
   * @dev Upgrades a proxy to the newest implementation of a contract and forwards a function call to it.
   * This is useful to initialize the proxied contract.
   * @param proxy Proxy to be upgraded.
   * @param packageName Name of the package where the contract is contained.
   * @param contractName Name of the contract.
   * @param data Data to send as msg.data in the low level call.
   * It should include the signature and the parameters of the function to be called, as described in
   * https://solidity.readthedocs.io/en/v0.4.24/abi-spec.html#function-selector-and-argument-encoding.
   */
  function upgradeAndCall(AdminUpgradeabilityProxy proxy, string memory packageName, string memory contractName, bytes memory data) payable public onlyOwner {
    address implementation = getImplementation(packageName, contractName);
    proxy.upgradeToAndCall{value: msg.value}(implementation, data);
  }
}
