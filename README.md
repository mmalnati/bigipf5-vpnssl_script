<h1>Script for creating vpn SSL users for the APM module of BIG-IP F5 via shell</h1>

The script automates the process of sign up the users, and configure the instance, groups, etc.
You can add more options to the command.
Here you can see the list:

```
Usage: ldbutil <operation> <arguments>
Operations is one of:
    --help      Display this help message
    --list      List all records
    --csv       Output all records in CSV format to file
    --show      Show a particular record
    --add       Add a record
    --delete    Delete a record
    --update    Update a record
    --sync      Sync latest cache updates to DB
    --force     Flush cache to DB - Must be used with --sync
    --backup    Backup all DB records
    --restore   Restore DB records from backup
    --hasync    Not yet implemented, only works with --when option
    --bulk      Used if this operation is part of a bulk update txn
    --allusers  Used with --list to show all types of users
    --when      Used with --hasync to show time of last HA synchronization

Arguments are one or more of:
    --uname="value"          Username
    --uid="value"            UID(a number)
    --instance="value"       Instance(e.g. /Common/vdb1)
    --password="value"       Password
    --user_groups="value"    Groups(comma separated)
    --lockout_start="value"  Lockout start (seconds since epoch)
    --locked_out="1 or 0"    1=User locked out, 0 otherwise
    --ttl="value"            Account creation time in seconds since epoch
    --duser="1 or 0"         1=Dynamically created user, 0 otherwise
    --login_failures="value" Number of login failures
    --change_passwd="1 or 0" 1=force passwd change, 0 otherwise
    --first_name="value"     First Name
    --last_name="value"      Last Name
    --email="value"          Email
    --limit="value"          Used with --list for pagination
    --file="value"           Filename for --backup, --restore and --csv
    --partition="value"      Used with --list for specific data
```

<h4>Definition of columns in the file data.txt</h4>

file: data.txt

```username /Common/instance 123456789 group 0 0 0 firstname lastname mail@mail.com```

I think most of the fields in the file you can get the idea what are they, but I will describe them just to be sure everyone understand them:

- username: user name (he!)
- /Common/instance: instance of the user
- 123456789: password
- group: group (hehe!)
- 0: The number of login failure attempts for the uname
- 0: Force the user to change their password 0 or 1 default 0 no password change required
- 0: The user's access locked out status 0 or 1 default 0 not locked out

This is how the scripts looks like running:

<code><img src="https://raw.githubusercontent.com/mmalnati/bigipf5-vpnssl_script/master/vpn-users.png"></code>

💬 If you have questions or suggest changes, leave a messege [here](https://github.com/mmalnati/bigipf5-vpnssl_script/issues)

