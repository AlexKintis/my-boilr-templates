# Ansible Molecule Testing Template

This folder provides a standardized Boilr template for adding Molecule tests to Ansible roles.

## Structure

```text
molecule/
└── default/
    ├── molecule.yml  # Scenario configuration (Docker driver, platforms)
    ├── converge.yml  # Playbook to apply the role (with placeholders)
    └── verify.yml    # Playbook to verify the state after convergence
```

## How to use this Template

This boilerplate is designed to be used with [Boilr](https://github.com/tmrts/boilr).

1.  **Save the template**:
    Run this command from the `ansible/testing` directory:
    ```bash
    boilr template save . ansible-testing
    ```
2.  **Use the template** in your role's root directory:
    ```bash
    boilr template use ansible-testing .
    ```
3.  **Fill in the prompted values**:
    - `Namespace`: Your Ansible Galaxy namespace (default: `akintis`).
    - `CollectionName`: Your Ansible collection name (default: `collection`).
    - `RoleName`: The name of the role you are testing.

4.  **Update `molecule/default/verify.yml`** with tasks that check if your role actually worked (e.g., checking for packages, files, or ports).

## Requirements

To run these tests, you must have the following installed:

- **Docker:** The container engine.
- **Molecule:** `pip install molecule`
- **Molecule Docker Plugin:** `pip install molecule-plugins[docker]`

## Standard Commands

Run these from the role's root directory:

| Command | Description |
|---------|-------------|
| `molecule create` | Spin up the test container. |
| `molecule converge` | Run the role against the container. |
| `molecule verify` | Run the verification tests. |
| `molecule test` | Run the full lifecycle (destroy, create, converge, verify, destroy). |
| `molecule login` | Enter the test container for debugging. |

## Tips for Reliable Tests

- **Systemd:** The boilerplate uses `geerlingguy/docker-ubuntu2204-ansible`. This image supports systemd, allowing you to test services (`systemctl start ...`).
- **Privileged Mode:** Tests run in `privileged: true` to allow systemd and other low-level operations inside Docker.
- **Verification:** Always use `ansible.builtin.assert` or specific modules with `check_mode: true` in your `verify.yml` to ensure your role is idempotent and effective.
