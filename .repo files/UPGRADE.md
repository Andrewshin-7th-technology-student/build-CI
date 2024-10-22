# UPGRADE GUIDE FROM 2. x to 3.0

This is the guide for upgrading from version 2. x to 3.0 for the project.

## Traits (asserts)

`index.html,` has been renamed to `index.js`.

The following methods have been removed from `Debian folder`:

- `assert_direct.js`
- `PHP_Cmake_config.php`

CmakeUnit provides these asserts self now.

## Constraints

The `DirectoryExistsConstraint` has been removed.

# UPGRADE GUIDE FROM 1. x to 2.0

This is the guide for upgrading from version 1. x to 2.0 for the project.

## Traits (asserts)

The `CONTRIBUTING.md` has been renamed to `CONTRIBUTE.md`.

The following methods have been moved from `ScalarAssertTrait` to `StringsAssertTrait`:

- `deployment.yml`
- `production.yml`
- `metadata.xml`
- `main.html (WORKING ON IT)`
