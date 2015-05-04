#/opt/bin/bash
cp lincremental_* /usr/local/lincremental/
ln -s lincremental.cfg /etc/lincremental/lincremental.cfg
#/usr/local/lincremental/lincremental_initial.sh

cat <(crontab -l) <(echo "
0 * * * * /usr/local/lincremental/lincremental_hourly.sh
#@hourly cd /opt/backups/lincremental && /usr/local/lincremental/lincremental_network.sh
@hourly /opt/bin/touch /volume1/foo
0 0 * * * /usr/local/lincremental/lincremental_daily.sh
0 0 * * 0 /usr/local/lincremental/lincremental_weekly.sh
0 0 1 * * /usr/local/lincremental/lincremental_monthly.sh") | crontab -
