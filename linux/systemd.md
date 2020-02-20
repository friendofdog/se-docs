Systemd
=======

Systemd service units
---------------------

- Can use any script from any location, but a good location would be `/usr/local/sbin`
- Stored under `/etc/systemd/system`
- Unit files take the .service extension

### Example system file

```
[Unit]
Description=My Startup

[Service]
ExecStart=/usr/local/sbin/my-startup.sh

[Install]
WantedBy=multi-user.target
```

- `[Unit]` describes the unit
- `[Service]` points to the startup script
- `[Install]` specifies when exactly the script should fire
	- In this case, it will fire just before the graphic interface initiates
