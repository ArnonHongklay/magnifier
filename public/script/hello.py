from flask import Flask, Response, make_response, request, current_app
from datetime import timedelta
from functools import update_wrapper
import socket, os

def crossdomain(origin=None, methods=None, headers=None,
                max_age=21600, attach_to_all=True,
                automatic_options=True):
    if methods is not None:
        methods = ', '.join(sorted(x.upper() for x in methods))
    if headers is not None and not isinstance(headers, basestring):
        headers = ', '.join(x.upper() for x in headers)
    if not isinstance(origin, basestring):
        origin = ', '.join(origin)
    if isinstance(max_age, timedelta):
        max_age = max_age.total_seconds()

    def get_methods():
        if methods is not None:
            return methods

        options_resp = current_app.make_default_options_response()
        return options_resp.headers['allow']

    def decorator(f):
        def wrapped_function(*args, **kwargs):
            if automatic_options and request.method == 'OPTIONS':
                resp = current_app.make_default_options_response()
            else:
                resp = make_response(f(*args, **kwargs))
            if not attach_to_all and request.method != 'OPTIONS':
                return resp

            h = resp.headers

            h['Access-Control-Allow-Origin'] = origin
            h['Access-Control-Allow-Methods'] = get_methods()
            h['Access-Control-Max-Age'] = str(max_age)
            if headers is not None:
                h['Access-Control-Allow-Headers'] = headers
            return resp

        f.provide_automatic_options = False
        return update_wrapper(wrapped_function, f)
    return decorator

def get_ip_address():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    return s.getsockname()[0]

def render(resp):
    return Response(response=resp, status=200, mimetype="application/json")

IP = get_ip_address()
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/xxx")
def xxx():
	xxx = os.popen('arp | awk \'BEGIN {print "["} NR>1 {print "{ address: "$1", hw_type: "$2", hw_address: "$3", flags: "$4", mark: "$5" }" } END {print "]"}\'').read()
	print xxx
	return render(xxx)

#general_info.sh
@app.route("/general_info")
@crossdomain(origin='*')
def general_info():
    return render(os.popen('./shell/general_info.sh').read())


@app.route("/arp_cache")
@crossdomain(origin='*')
def arp_cache():
    return render(os.popen('./shell/arp_cache.sh').read())

@app.route("/bandwidth")
@crossdomain(origin='*')
def bandwidth():
    return render(os.popen('./shell/bandwidth.sh').read())

@app.route("/common_applications")
@crossdomain(origin='*')
def common_applications():
    return render(os.popen('./shell/common_applications.sh').read())

@app.route("/cpu_info")
@crossdomain(origin='*')
def cpu_info():
    return render(os.popen('./shell/cpu_info.sh').read())

@app.route("/cpu_intensive_processes")
@crossdomain(origin='*')
def cpu_intensive_processes():
    return render(os.popen('./shell/cpu_intensive_processes.sh').read())

@app.route("/cron_history")
@crossdomain(origin='*')
def cron_history():
    return render(os.popen('./shell/cron_history.sh').read())

@app.route("/current_ram")
@crossdomain(origin='*')
def current_ram():
    return render(os.popen('./shell/current_ram.sh').read())

@app.route("/disk_partitions")
@crossdomain(origin='*')
def disk_partitions():
    return render(os.popen('./shell/disk_partitions.sh').read())

@app.route("/download_transfer_rate")
@crossdomain(origin='*')
def download_transfer_rate():
    return render(os.popen('./shell/download_transfer_rate.sh').read())

@app.route("/internet_speed")
@crossdomain(origin='*')
def internet_speed():
    return render(os.popen('./shell/internet_speed.sh').read())

@app.route("/io_stats")
@crossdomain(origin='*')
def io_stats():
    return render(os.popen('./shell/io_stats.sh').read())

@app.route("/ip_addresses")
@crossdomain(origin='*')
def ip_addresses():
    return render(os.popen('./shell/ip_addresses.sh').read())

@app.route("/load_avg")
@crossdomain(origin='*')
def load_avg():
    return render(os.popen('./shell/load_avg.sh').read())

@app.route("/logged_in_users")
@crossdomain(origin='*')
def logged_in_users():
    return render(os.popen('./shell/logged_in_users.sh').read())

@app.route("/memcached")
@crossdomain(origin='*')
def memcached():
    return render(os.popen('./shell/memcached.sh').read())

@app.route("/memory_info")
@crossdomain(origin='*')
def memory_info():
    return render(os.popen('./shell/memory_info.sh').read())

@app.route("/network_connections")
@crossdomain(origin='*')
def network_connections():
    return render(os.popen('./shell/network_connections.sh').read())

@app.route("/number_of_cpu_cores")
@crossdomain(origin='*')
def number_of_cpu_cores():
    return render(os.popen('./shell/number_of_cpu_cores.sh').read())

@app.route("/ping")
@crossdomain(origin='*')
def ping():
    return render(os.popen('./shell/ping.sh').read())

@app.route("/ram_intensive_processes")
@crossdomain(origin='*')
def ram_intensive_processes():
    return render(os.popen('./shell/ram_intensive_processes.sh').read())

@app.route("/recent_account_logins")
@crossdomain(origin='*')
def recent_account_logins():
    return render(os.popen('./shell/recent_account_logins.sh').read())

@app.route("/scheduled_crons")
@crossdomain(origin='*')
def scheduled_crons():
    return render(os.popen('./shell/scheduled_crons.sh').read())

@app.route("/swap")
@crossdomain(origin='*')
def swap():
    return render(os.popen('./shell/swap.sh').read())

@app.route("/upload_transfer_rate")
@crossdomain(origin='*')
def upload_transfer_rate():
    return render(os.popen('./shell/upload_transfer_rate.sh').read())

@app.route("/user_accounts")
@crossdomain(origin='*')
def user_accounts():
    return render(os.popen('./shell/user_accounts.sh').read())

if __name__ == "__main__":
    app.run(host=IP, port=9999)
