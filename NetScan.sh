if [ $1 == "--help" ]
then echo "This tool for discover hosts in network, if you want to run this tool please type ./NetScan --run"
fi
if [ $1 == "--run"  ]
then ip=$(ifconfig eth0 | grep netmask | cut -d "n" -f 2 | sed 's/et //' | cut -d "." -f 1,2,3,4)
octet=1
echo "NetScan is running ..."
while [ $octet -lt 255 ]
do ipv4=$(ping -c 1 $ip.$octet | grep ttl | cut -d ":" -f 1 | sed 's/64  //')
if [ ! -z "$ipv4"]

then echo "               Host Found , IP : $ipv4"
fi
octet=$(($octet + 1))
done
fi

