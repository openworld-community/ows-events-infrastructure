
# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/bin:/usr/bin:/bin:/usr/games

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
{% if PermitRootLogin is defined %}PermitRootLogin {{ PermitRootLogin }}{% else %}PermitRootLogin yes{% endif %}

#StrictModes yes
{% if MaxAuthTries is defined %}MaxAuthTries {{ MaxAuthTries }}{% else %}#MaxAuthTries 6{% endif %}

#MaxSessions 10
{% if PubkeyAuthentication is defined %}PubkeyAuthentication {{ PubkeyAuthentication }}{% else %}#PubkeyAuthentication yes{% endif %}

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
#AuthorizedKeysFile	.ssh/authorized_keys .ssh/authorized_keys2

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
{% if IgnoreRhosts is defined %}IgnoreRhosts {{ IgnoreRhosts }}{% else %}#IgnoreRhosts yes{% endif %}

# To disable tunneled clear text passwords, change to no here!
{% if PasswordAuthentication is defined %}PasswordAuthentication {{ PasswordAuthentication }}{% else %}PasswordAuthentication yes{% endif %}

{% if PermitEmptyPasswords is defined %}PermitEmptyPasswords {{ PermitEmptyPasswords }}{% else %}#PermitEmptyPasswords no{% endif %}

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
{% if KbdInteractiveAuthentication is defined %}KbdInteractiveAuthentication {{ KbdInteractiveAuthentication }}{% else %}KbdInteractiveAuthentication no{% endif %}

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the KbdInteractiveAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via KbdInteractiveAuthentication may bypass
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and KbdInteractiveAuthentication to 'no'.
{% if UsePAM is defined %}UsePAM {{ UsePAM }}{% else %}UsePAM yes{% endif %}

#AllowAgentForwarding yes
{% if AllowTcpForwarding is defined %}AllowTcpForwarding {{ AllowTcpForwarding }}{% else %}#AllowTcpForwarding yes{% endif %}

#GatewayPorts no
{% if X11Forwarding is defined %}X11Forwarding {{ X11Forwarding }}{% else %}X11Forwarding yes{% endif %}

#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
{% if PrintMotd is defined %}PrintMotd {{ PrintMotd }}{% else %}PrintMotd no{% endif %}

#PrintLastLog yes
{% if TCPKeepAlive is defined %}TCPKeepAlive {{ TCPKeepAlive }}{% else %}#TCPKeepAlive yes{% endif %}

#PermitUserEnvironment no
#Compression delayed
{% if ClientAliveInterval is defined %}ClientAliveInterval {{ ClientAliveInterval }}{% else %}#ClientAliveInterval 0{% endif %}

{% if ClientAliveCountMax is defined %}ClientAliveCountMax {{ ClientAliveCountMax }}{% else %}#ClientAliveCountMax 3{% endif %}

{% if UseDNS is defined %}UseDNS {{ UseDNS }}{% else %}#UseDNS no{% endif %}

#PidFile /run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# Allow client to pass locale environment variables
{% if AcceptEnv is defined %}AcceptEnv {{ AcceptEnv }}{% else %}AcceptEnv LANG LC_*{% endif %}

{% if Protocol is defined %}Protocol {{ Protocol }}{% else %}#Protocol 2, 1{% endif %}

{% if AllowUsers is defined %}AllowUsers {{ AllowUsers }}{% else %}#AllowUsers{% endif %}

{% if AllowGroups is defined %}AllowGroups {{ AllowGroups }}{% else %}#AllowGroups{% endif %}

# override default of no subsystems
Subsystem	sftp	/usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#	X11Forwarding no
#	AllowTcpForwarding no
#	PermitTTY no
#	ForceCommand cvs server
