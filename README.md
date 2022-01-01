# Automated Nginx Proxy for Raspberry Pi

## Setup and Usage

- Follow upstream repo instructions here: [@nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) or
- ```
  git clone https://github.com/avidsapp/arm64-nginx-proxy.git proxy
  cd proxy
  docker-compose up -d
  ```

## Reboot Scripts

[Settings to ensure](https://askubuntu.com/questions/814/how-to-run-scripts-on-start-up) reboot spins up proxy containers - change `<USER>` and run `sudo nano /etc/systemd/system/proxy-startup.service`:
```
[Unit]
Description=Proxy startup script

[Service]
ExecStart=/home/<USER>/proxy/proxy-startup.sh
Type=oneshot
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
Then run:
```
sudo systemctl daemon-reload
sudo systemctl enable proxy-startup.service
```
Then add a [reboot CRON job](https://askubuntu.com/questions/290099/how-to-run-a-script-during-boot-as-root) under the root user - change `<USER>` and run `sudo crontab -e`:
```
@reboot /home/<USER>/proxy/proxy-startup.sh
```
