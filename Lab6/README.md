# lab6: Ansible Vault 
## Objective: Use Ansible Vault to encrypt sensitive information, such as database passwords, and incorporate the encrypted data into an Ansible playbook.

### Step1:Create the Vault-File:
**ansible-vault create vault.yml**
prompt will appear to enter a password of the vault-file 
inside vault file write

```
db_password : your_pass
```
## Step2: Create another VM or EC2 instane on AWS 

## Step3: Create playbookfile
install_sql.yaml
```
---
- name: Install MySQL and create a db user
  hosts: dbservers
  vars_files:

  tasks:
    - name: install mysql server
      apt:
        name: mysql-server
        state: present
      notify: Start mysql-service

    - name: ensure mysql-service is running
      service:
        name: mysql
        state: started
        enabled: yes

    - name: install Python mysql lib.
      apt:
        name: python3-mysqldb
        state: present

    - name: Create mysql user
      mysql_user:
        name: dbuser
        host: "%"
        password: "{{ db_password }}"
        priv: '*.*:CREATE,INSERT,UPDATE,DELETE,SELECT'
        state: present

  handlers:
    - name: Start mysql-service
      service:
        name: mysql
        state: started
```

# to run the playbook
**ansible-playbook install_mysql.yaml --ask-vault-pass**
