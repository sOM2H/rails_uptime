require 'rails_uptime/version'

module Rails
  def self.uptime()
    pid = IO.read('tmp/pids/server.pid')
    system('ps -eo pid,etime | grep ' + pid.to_s + " | awk '{print $2}' > time.txt")
    time = IO.read('time.txt').chomp
    time
  end
end
