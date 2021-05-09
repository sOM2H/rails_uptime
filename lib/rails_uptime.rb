require 'rails_uptime/version'
require 'open3'

module Rails
  def self.uptime()
    pid  = Process.pid
    cmd = 'ps -o etimes -p' + pid.to_s + " | grep -o '[[:digit:]]*'"
    time = 0
    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      time = stdout.read.to_i
    end
    m, s = time.divmod(60)
    h, m = m.divmod(60)
    d, h = h.divmod(24)
    { d: d, h: h, m: m, s: s }
  end
end
